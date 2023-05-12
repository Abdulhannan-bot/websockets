from django.urls import path, include
from . import views

urlpatterns = [
  path('', views.home, name='home'),    
  path('login', views.login_view, name='login'),
  path('logout', views.logout_view, name='logout'),
  # path('add-sms/<str:id>', views.add_sms, name='add-sms')
]