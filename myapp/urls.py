from django.urls import path, include
from . import views

urlpatterns = [
  path('', views.home, name='home'),    
  path('login', views.login_view, name='login'),
  path('logout', views.logout_view, name='logout'),
  path('test', views.test, name="test"),
  path('mark_read/', views.test, name="mark_read"),
  # path('add-sms/<str:id>', views.add_sms, name='add-sms')
]