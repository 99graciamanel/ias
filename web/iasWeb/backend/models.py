from django.db import models
from django.conf import settings
from mirage import fields
from mirage.fields import EncryptedCharField, EncryptedIntegerField

class Folder(models.Model):
    name = EncryptedCharField()

class UserInFolder(models.Model):
    class Meta:
        unique_together = (('user', 'folder'),)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True)
    folder = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)
    role = EncryptedIntegerField()

class File(models.Model):
    name = EncryptedCharField()
    path = EncryptedCharField()
    directory = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)