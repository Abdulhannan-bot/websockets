from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.db.models import Subquery, OuterRef, Max, Q, Count
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from django.http import HttpResponse
from .decorators import *
from .models import *
from .consumers import *

import time
from datetime import datetime

# Create your views here.

@unauthenticated_user
def login_view(request):
  if(request.method == "POST"):
    username = request.POST.get('username')
    password = request.POST.get('password')
    user = authenticate(request, username=username, password=password)
    if(user is not None):
      login(request, user)
      return redirect('home')
    else:
      print("not authenticated")
  return render(request, "login.html")

@login_required(login_url = 'login')
def home(request):
    # print(request.headers.get('upgrade'))
    # if request.headers.get('upgrade') == 'websocket':
    #     room_name = request.GET.get('contact')
    #     consumer = ChatConsumer.as_asgi()
    #     response = consumer(request)
    #     return response
    user = request.user
    contacts = Contact.objects.exclude(user = user)
    from_contact = Contact.objects.get(user = user)

    # latest_messages = Message.objects.filter(
    #   models.Q(from_user=OuterRef('user')) | models.Q(to_user=OuterRef('user'))
    # ).order_by('-created_at')

    latest_messages = Message.objects.filter(
      Q(from_user=request.user, to_user=OuterRef('user')) | 
      Q(from_user=OuterRef('user'), to_user=request.user)
    ).order_by('-created_at')

    unread_messages = Message.objects.filter(Q(from_user=OuterRef('user'), to_user=request.user, read_by=False))
    unread_messages_subquery = unread_messages.values('to_user').annotate(count=Count('to_user')).values('count')
    # for i in read_messages:
    #   print(i.sms)
    
    # for i in latest_messages:
    #   print(i.from_user, i.to_user, i.sms)

    contacts = Contact.objects.annotate(
        latest_message=Subquery(latest_messages.values('sms')[:1]),
        latest_message_time=Subquery(latest_messages.values('created_at')[:1]),
        # unread_messages_count=Subquery(
        # read_messages.filter(read_by=False)
        # .values('id')
        # .annotate(count=Count('id'))
        # .values('count')[:1]
        # ),
        unread_messages_count=Subquery(unread_messages_subquery),
        # unread_messages = Subquery(read_messages.values('id').annotate(count=Count('id', distinct=True)).values('from_user'))
        ).order_by("-latest_message_time").exclude(user = request.user)

    for i in contacts:
      print(i.unread_messages_count)

    users = User.objects.all()

    room_names= []
    for i in users:
      room_id = int(i.id) + int(request.user.id)
      room_names.append(f'room{room_id}')

    context = {
      'contacts': contacts,
      'from_id': request.user.id,
      'from_contact': from_contact,
      'room_names': room_names,
    }
    value = request.GET.get('contact')
    if value:
      to = User.objects.get(id = value)
      to_contact = Contact.objects.get(user = to)
      messages = Message.objects.all()
      from_messages = Message.objects.filter(from_user = request.user, to_user = to)
      to_messages = Message.objects.filter(from_user=to, to_user=request.user)
      

      unread_message = to_messages.filter(read_by=False)
      for i in unread_message:
        i.read_by = True
        i.save()

      try:
        check_message = Message.objects.get(sms = 'this is 101 testing')
        print(check_message.read_by)
      except:
        print("not yet stored")

      unread_messages = Message.objects.filter(Q(from_user=OuterRef('user'), to_user=request.user, read_by=False))

      unread_messages_subquery = unread_messages.values('to_user').filter(read_by=False).annotate(count=Count('to_user')).values('count')
      contacts = Contact.objects.annotate(
        latest_message=Subquery(latest_messages.values('sms')[:1]),
        latest_message_time=Subquery(latest_messages.values('created_at')[:1]),
        unread_messages_count=Subquery(unread_messages_subquery),
        ).order_by("-latest_message_time").exclude(user = request.user)
      
      context['contacts'] = contacts

      room_id = int(to.id) + int(request.user.id)
      room_name = f'room{room_id}'

      context['show_chat'] = True
      context['from_messages'] = from_messages
      context['to_messages'] = to_messages
      context['messages'] = messages
      context['value'] = to
      context['to_value'] = to_contact
      context['from'] = request.user.username
      context['to'] = to.username
      context['room'] = room_name
 
    return render(request, 'base.html', context = context)



def logout_view(request):
  logout(request)
  return redirect('login')

def test(request):
  return JsonResponse({'message': True})

def mark_read(request):
  to_user = request.POST.get('to_user')
  from_user = request.POST.get('from_user')
  sms = request.POST.get('sms')
  try:
    # message = Message.objects.get(from_user = from_user, to_user = to_user, sms = sms)
    message = get_object_or_404(Message, from_user=from_user, to_user=to_user, sms=sms)
    message.read_by = True
    message.save()
    return JsonResponse({'message': 'success'})
  except Message.DoesNotExist:
    return JsonResponse({'message': 'failed'})
