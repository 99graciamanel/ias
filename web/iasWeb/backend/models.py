from django.db import models
from django.conf import settings

class Folder(models.Model):
    name = models.CharField(max_length=20)

class UserInFolder(models.Model):
    class Meta:
        unique_together = (('user', 'folder'),)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True)
    folder = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)
    role = models.IntegerField()

class File(models.Model):
    name = models.CharField(max_length=50)
    path = models.CharField(max_length=100)
    directory = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)