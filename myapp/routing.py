from django.urls import re_path

from . import consumers
# ws/chat/(?P<room_name>\w+)/$
websocket_urlpatterns = [
    # re_path(r'ws/chat/<str:room_name>/', consumers.ChatConsumer.as_asgi()),
    # re_path(r'ws/chat/(?P<room_name>\w+)/(?P<from>\w+)/(?P<to>\w+)$', consumers.ChatConsumer.as_asgi()),
    re_path(r'ws/chat/(?P<room_name>\w+)/$', consumers.ChatConsumer.as_asgi())
    # re_path(r'ws/socket-server', consumers.ChatConsumer.as_asgi())
]
