from django.shortcuts import render, redirect
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from django.contrib.auth import login, logout, authenticate
from rest_framework.authtoken.models import Token
from django.db.models import Subquery, OuterRef, Max, Q, Count
import json
from copy import deepcopy
# Create your views here.

from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)

from .serializers import *
from myapp.models import *

@api_view(["POST"])
@permission_classes((AllowAny,))
def login_view(request):
  if request.method=="POST":
    body = json.loads(request.body)
    username = body.get("username")
    password = body.get("password")
    if username is None or password is None:
      return Response({'error': 'Please provide both username and password'}, status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
      return Response({'error': 'Invalid Credentials'}, status=HTTP_404_NOT_FOUND)
    token, _ = Token.objects.get_or_create(user=user)
    login(request,user)
    return Response({'token': token.key, 'user': token.user.username, 'name': token.user.contact.name, 'userId': token.user.id}, status=HTTP_200_OK)
  return Response("login failed")

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def contacts(request, key):
  token = Token.objects.get(key = key)
  user = token.user
  latest_messages = Message.objects.filter(
      Q(from_user=user, to_user=OuterRef('user')) | 
      Q(from_user=OuterRef('user'), to_user=user)
    ).order_by('-created_at')
  
  unread_messages = Message.objects.filter(Q(from_user=OuterRef('user'), to_user=user, read_by=False))
  unread_messages_subquery = unread_messages.values('to_user').annotate(count=Count('to_user')).values('count')
  
  contacts = Contact.objects.annotate(
      latest_message=Subquery(latest_messages.values('sms')[:1]),
      latest_message_time=Subquery(latest_messages.values('created_at')[:1]),
      latest_message_user=Subquery(latest_messages.values('from_user')[:1]),
      latest_message_read=Subquery(latest_messages.values('read_by')[:1]),
      unread_messages_count=Subquery(unread_messages_subquery),
      ).order_by("-latest_message_time").exclude(user = user)
 
 
  serializers = ContactSerializer(contacts, many=True)
  return Response(serializers.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def chat_room(request, key, to_user):
  token = Token.objects.get(key = key)
  From = token.user
  to = User.objects.get(id = to_user)
  chat_room_messages = Message.objects.filter(Q(from_user = From, to_user = to) | Q(from_user=to, to_user=From))
  to_messages = Message.objects.filter(from_user=to, to_user=From)
  mark_read_messages = to_messages.filter(read_by=False)
  # for i in mark_read_messages:
  #   i.read_by = True
  #   i.save()

  serializers = MessageSerializer(chat_room_messages, many=True)
  new_serializers = deepcopy(serializers.data)
  for item in new_serializers:
    item['from_name'] = From.contact.name
    item['to_name'] = to.contact.name
  return Response(new_serializers)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def send_message(request):
  if request.method == "POST":
    body = json.loads(request.body)
    from_user = body.get("fromUser")
    to_user = body.get("toUser")
    message = body.get("message")
    try:
      from_user = User.objects.get(id = from_user)
      to_user = User.objects.get(id = to_user)
      Message.objects.create(from_user = from_user, to_user = to_user, sms = message)
      return Response({"Message send successfully"})
    except:
      return Response({"Message not sent"})
  return Response({"No POST request found"})


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_view(request, key):
  token = Token.objects.get(key=key)
  token.delete()
  logout(request)
  return Response("Logged out succesfully")
