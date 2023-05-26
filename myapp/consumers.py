# consumers.py

from channels.generic.websocket import AsyncWebsocketConsumer
from channels.generic.websocket import WebsocketConsumer
import json
from asgiref.sync import async_to_sync

import asyncio
import django
django.setup()

from .models import *
from asgiref.sync import sync_to_async
from channels.db import database_sync_to_async
from django.db.models import Subquery, OuterRef, Max, Q, Count
from datetime import datetime



class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = f'chat_{self.room_name}'

        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    async def receive(self,text_data,):
        message = json.loads(text_data)
        message_text = message['message']
        to = message['to']
        From = message['from']
        from_user = await sync_to_async(User.objects.get)(id = From)
        to_user = await sync_to_async(User.objects.get)(id = to)
        from_user_name = from_user.first_name+" "+from_user.last_name
        to_user_name = to_user.first_name+" "+to_user.last_name
        # await sync_to_async(Message.objects.create)(from_user = from_user, to_user= to_user, sms=message_text)
        message_obj = await sync_to_async(Message.objects.create)(
          from_user=from_user, to_user=to_user, sms=message_text
        )
        await sync_to_async(message_obj.save)()
        latest_message_id = message_obj.id
        created_time = datetime.now().isoformat()
        to_unread_messages = sync_to_async(Message.objects.filter(from_user = from_user, to_user = to_user, read_by=False).count)
        to_unread_messages_count = await to_unread_messages()
        contact_name = await sync_to_async(Contact.objects.get)(user = from_user)
        contact_name = contact_name.name


        # Send message to room group
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat.message',
                'message': message_text,
                'to': to,
                'from': From,
                'from_name': from_user_name,
                'to_name': to_user_name,
                'to_unread_messages': to_unread_messages_count,
                'time': created_time,
                'contact_name': contact_name,
                'latest_message_id': latest_message_id,
            }
        )

    async def chat_message(self, event):
        message = event['message']
        to = event['to']
        From = event['from']
        from_user_name = event['from_name']
        to_user_name = event['to_name']
        to_unread_message_count = event['to_unread_messages']
        time = event['time']
        contact_name = event['contact_name']
        latest_message_id = event['latest_message_id']
        # time = time.isoformat()
        # contacts = event['contactsList']
        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'message': message,
            'to': to,
            'from': From,
            'from_name': from_user_name,
            'to_name': to_user_name,
            'to_unread_messages_count': to_unread_message_count,
            'time': time,
            'contactName' : contact_name,
            'latest_message_id': latest_message_id,
        }))


class NotifyConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = f'notify_{self.room_name}'

        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    

    async def receive(self, text_data):
        message = json.loads(text_data)
        # read_check = message['read']
        contact = message['contact']
        From = message['from']
        from_user = await sync_to_async(User.objects.get)(id = From)
        to_user = await sync_to_async(User.objects.get)(id = contact)
        the_messages = await sync_to_async(Message.objects.filter)(from_user = to_user, to_user=from_user, read_by=False)
        # the_messages = await sync_to_async(the_messages.order_by)('-created_at')
        # async for i in the_messages:               
        #   i.read_by = True
        #   print(i.sms)
        #   await sync_to_async(i.save)()
        from_user_name = await sync_to_async(Contact.objects.get)(user = from_user)
        from_name = from_user_name.name 
        async def update_read_by(message):
          message.read_by = True
          await sync_to_async(message.save)()
        messages_list = await sync_to_async(list)(the_messages)
        await asyncio.gather(*[update_read_by(message) for message in messages_list])
        # the_messages = await sync_to_async(list)(the_messages)  # Convert queryset to a list

        
        await self.channel_layer.group_send(
            self.room_group_name,{
                'type': 'chat.message',
                # 'read':read_check,
                'contact': contact,
                'from': From,
                'from_name':from_name
            }
        )

    async def chat_message(self, event):
        # read_check = event['read']
        contact = event['contact']
        From = event['from']
        from_name = event['from_name']
        await self.send(text_data=json.dumps({
            # 'read': read_check,
            'contact': contact,
            'from': From,
            'from_name': from_name,
        }))
        
