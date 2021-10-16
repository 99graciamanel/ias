from django.db import models
from django.conf import settings
from mirage import fields
from mirage.fields import EncryptedCharField

class Folder(models.Model):
    #name = models.CharField(max_length=20)
    name = EncryptedCharField()

class UserInFolder(models.Model):
    class Meta:
        unique_together = (('user', 'folder'),)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True)
    folder = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)
    role = models.IntegerField()

class File(models.Model):
    #name = models.CharField(max_length=50)
    name = EncryptedCharField()
    path = models.CharField(max_length=100)
    directory = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)