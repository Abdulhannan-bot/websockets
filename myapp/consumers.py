# consumers.py

from channels.generic.websocket import AsyncWebsocketConsumer
from channels.generic.websocket import WebsocketConsumer
import json
from asgiref.sync import async_to_sync
from .models import *
from asgiref.sync import sync_to_async

# class ChatConsumer(AsyncWebsocketConsumer):
#     async def connect(self):
#         print(self.scope)
#         self.room_name = self.scope['url_route']['kwargs']['room_name']
#         self.room_group_name = 'chat_%s' % self.room_name

#         # Join room group
#         await self.channel_layer.group_add(
#             self.room_group_name,
#             self.channel_name
#         )

#         await self.accept()

#     async def disconnect(self, close_code):
#         # Leave room group
#         await self.channel_layer.group_discard(
#             self.room_group_name,
#             self.channel_name
#         )

#     async def receive(self, text_data):
#         text_data_json = json.loads(text_data)
#         message = text_data_json['message']

#         # Send message to room group
#         await self.channel_layer.group_send(
#             self.room_group_name,
#             {
#                 'type': 'chat_message',
#                 'message': message
#             }
#         )

#     async def chat_message(self, event):
#         message = event['message']

#         # Send message to WebSocket
#         await self.send(text_data=json.dumps({
#             'message': message
#         }))


# class ChatConsumer(WebsocketConsumer):
#   def connect(self):
#     self.room_group_name = 'test'
#     async_to_sync(self.channel_layer.group_add)(
#       self.room_group_name,
#       self.channel_name,
#     )
#     self.accept()

#     # self.send(text_data=json.dumps({
#     #   'type': 'connection_established',
#     #   'message': 'You are now connected'
#     # }))

#   def receive(self, text_data):
#     text_data_json = json.loads(text_data)
#     message = text_data_json['message']

#     async_to_sync(self.channel_layer.group_send)(
#       self.room_group_name,
#       {
#         'type': 'chat_message',
#         'message': message,
#       }
#     )

#     # print(message)

#     # self.send(text_data=json.dumps({
#     #   'type': 'chat',
#     #   'message': message,
#     # }))

  
#   def chat_message(self, event):
#     message = event['message']
#     self.send(text_data=json.dumps({
#       'type': 'chat',
#       'message': message,
#     }))

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

    async def receive(self, text_data,):
        message = json.loads(text_data)
        message_text = message['message']
        to = message['to']
        From = message['from']
        from_user = await sync_to_async(User.objects.get)(id = From)
        to_user = await sync_to_async(User.objects.get)(id = to)
        print(from_user.username)
        print(to_user.username)
        print(message_text)
        await sync_to_async(Message.objects.create)(from_user = from_user, to_user= to_user, sms=message_text)
        # Send message to room group
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat.message',
                'message': message_text,
                'to': to,
                'from': From,
            }
        )

    async def chat_message(self, event):
        message = event['message']
        to = event['to']
        From = event['from']
        
        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'message': message,
            'to': to,
            'from': From,
        }))


# def chat_consumer(request, room_name):
#     # Set up WebSocket connection
#     websocket = WebsocketConsumer()
#     websocket.scope = {'url_route': {'kwargs': {'room_name': room_name}}}
#     websocket.room_name = room_name
#     websocket.room_group_name = 'chat_%s' % room_name

#     # Join room group
#     async_to_sync(websocket.channel_layer.group_add)(
#         websocket.room_group_name,
#         websocket.channel_name
#     )

#     # Accept WebSocket connection
#     websocket.accept()

#     try:
#         while True:
#             # Receive message from WebSocket
#             text_data = websocket.recv()
#             if not text_data:
#                 break
#             text_data_json = json.loads(text_data)
#             message = text_data_json['message']

#             # Send message to room group
#             async_to_sync(websocket.channel_layer.group_send)(
#                 websocket.room_group_name,
#                 {
#                     'type': 'chat_message',
#                     'message': message
#                 }
#             )
#     finally:
#         # Leave room group
#         async_to_sync(websocket.channel_layer.group_discard)(
#             websocket.room_group_name,
#             websocket.channel_name
#         )

#         # Close WebSocket connection
#         websocket.close()
        
#     return websocket

# class ChatConsumer(WebsocketConsumer):
#   def connect(self):
#     self.room_group_name = 'test'
#     async_to_sync(self.channel_layer.group_add)(
#       self.room_group_name,
#       self.channel_name,
#     )
#     self.accept()

#   def receive(self, text_data):
#     text_data_json = json.loads(text_data)
#     message = text_data_json['message']

#     async_to_sync(self.channel_layer.group_send)(
#       self.room_group_name,
#       {
#         'type': 'chat_message',
#         'message': message,
#       }
#     )

  
#   def chat_message(self, event):
#     message = event['message']
#     self.send(text_data=json.dumps({
#       'type': 'chat',
#       'message': message,
#     }))