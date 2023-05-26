from django.urls import path

from . import views

urlpatterns = [
  path('login', views.login_view, name='authenticate'),
  path('contacts-list/<str:key>', views.contacts, name='contacts_list'),
  path('chat_room/<str:key>/<str:to_user>', views.chat_room, name='chat_room'),
  path('send_message', views.send_message, name="send_message"),
  path('logout/<str:key>',views.logout_view,name="delete-token"),
]