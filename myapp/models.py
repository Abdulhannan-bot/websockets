from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from django.utils import timezone


# Create your models here.

class Contact(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.TextField(null = True)

class Message(models.Model):
    from_user = models.ForeignKey(User, null=True, related_name='from_user', on_delete=models.CASCADE)
    to_user = models.ForeignKey(User, null=True,related_name='to_user', on_delete=models.CASCADE)
    # read_by = models.ForeignKey(User, null = True, related_name='read_by', on_delete=models.CASCADE)
    read_by = models.BooleanField(default=False)
    sms = models.TextField(null = True)
    created_at = models.DateTimeField(default=timezone.now)

@receiver(post_save, sender = User)
def user_generator(sender, created, instance, **kwargs):
  if created:
    Contact.objects.create(
      user = instance,
      name = instance.first_name+" "+instance.last_name)
    