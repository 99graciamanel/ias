# Generated by Django 3.2.7 on 2021-10-24 10:03

from django.db import migrations
import mirage.fields


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0008_alter_file_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='file',
            name='path',
            field=mirage.fields.EncryptedCharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='userinfolder',
            name='role',
            field=mirage.fields.EncryptedIntegerField(max_length=64),
        ),
    ]
