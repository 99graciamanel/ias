# Generated by Django 3.2.7 on 2021-10-16 13:15

from django.db import migrations
import mirage.fields


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0005_alter_userinfolder_user'),
    ]

    operations = [
        migrations.DeleteModel(
            name='User',
        ),
        migrations.AlterField(
            model_name='folder',
            name='name',
            field=mirage.fields.EncryptedCharField(max_length=20),
        ),
    ]