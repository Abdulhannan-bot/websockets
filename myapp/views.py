from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from django.http import HttpResponse
from .decorators import *
from .models import *
from .consumers import *

import time

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
    print(request.user.id)
    contacts = Contact.objects.exclude(user = user)
    from_contact = Contact.objects.get(user = user)
    context = {
      'contacts': contacts,
      'from_id': request.user.id,
      'from_contact': from_contact,
    }
    value = request.GET.get('contact')
    if value:
      to = User.objects.get(username = value)
      to_contact = Contact.objects.get(user = to)
      messages = Message.objects.all()
      from_messages = Message.objects.filter(from_user = request.user, to_user = to)
      to_messages = Message.objects.filter(from_user=to, to_user=request.user)

      room_id = int(to.id) + int(request.user.id)
      room_name = f'room{room_id}'
      print(f'room name {room_name}')

      context['show_chat'] = True
      context['from_messages'] = from_messages
      context['to_messages'] = to_messages
      context['messages'] = messages
      context['value'] = to
      context['to_value'] = to_contact
      context['from'] = request.user.username
      context['to'] = to.username
      context['room'] = room_name
      # if request.method == 'POST':
      #   print(request.POST)
      # if request.method =="POST" and request.POST.get('sms'):
      #   sms = request.POST.get('sms')
      #   print("yes entered")
      #   if sms:
      #     Message.objects.create(from_user=request.user, to_user=to, sms=sms)
    # if request.method =="POST":
    #     print(request)
    #     sms = request.POST.get('sms')
    #     print("yes entered")
    #     if sms:
    #       Message.objects.create(from_user=request.user, to_user=to, sms=sms)

    return render(request, 'base.html', context = context)

# def add_sms(request, id):
#   to = User.objects.get(id = id)
#   print(to.username)
#   Message.objects.create(from_user = request.user, to_user = to, sms = 'sms')
#   return redirect('home'+f'/')


def logout_view(request):
  logout(request)
  return redirect('login')