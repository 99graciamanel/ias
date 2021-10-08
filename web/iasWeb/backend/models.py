from django.db import models

# Create your models here.
class User(models.Model):
    keycloak_id = models.CharField(max_length=200)
    name = models.CharField(max_length=15)

class Folder(models.Model):
    name = models.CharField(max_length=20)

class UserInFolder(models.Model):
    class Meta:
        unique_together = (('user', 'Folder'),)
    ROLES = (
        (0, 'Owner'),
        (1, 'Editor'),
        (2, 'Guest'),
    )
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    Folder = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)
    role = models.IntegerField(choices=ROLES)

class File(models.Model):
    name = models.CharField(max_length=20)
    path = models.CharField(max_length=20)
    directory = models.ForeignKey(Folder, on_delete=models.CASCADE, null=True)