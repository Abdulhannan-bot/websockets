# Generated by Django 3.2.18 on 2023-05-15 17:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0008_message_read'),
    ]

    operations = [
        migrations.RenameField(
            model_name='message',
            old_name='read',
            new_name='read_by',
        ),
    ]
