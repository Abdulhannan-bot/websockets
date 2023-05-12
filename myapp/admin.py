from django.contrib import admin

# Register your models here.

from .models import *

class ContactAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'name']
    search_field = ['user', 'name']

admin.site.register(Contact, ContactAdmin)

class MessageAdmin(admin.ModelAdmin):
    list_display = ['id', 'from_user', 'to_user','sms', 'created_at']
    search_field = ['user']

admin.site.register(Message, MessageAdmin)