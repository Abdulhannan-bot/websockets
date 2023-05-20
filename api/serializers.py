from rest_framework import serializers
from django.contrib.auth.models import User
from myapp.models import *

class ContactSerializer(serializers.ModelSerializer):
    latest_message = serializers.CharField()
    latest_message_time = serializers.DateTimeField()
    unread_messages_count = serializers.IntegerField()
    class Meta:
        model = Contact
        fields = ['id', 'user', 'name', 'latest_message', 'latest_message_time', 'unread_messages_count' ]

class MessageSerializer(serializers.ModelSerializer):
    # from_username = serializers.CharField()
    # to_username = serializers.CharField()
    class Meta:
        model = Message
        fields = ['id', 'from_user', 'to_user', 'sms', 'read_by', 'created_at']