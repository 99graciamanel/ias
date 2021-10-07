from django.db import models

# Create your models here.
class Usuari(models.Model):
    keycloak_id = models.CharField(max_length=200)
    nom = models.CharField(max_length=15)

class Directori(models.Model):
    nom = models.CharField(max_length=20)

class UsuariEnDirectori(models.Model):
    class Meta:
        unique_together = (('usuari', 'directori'),)
    ROLS = (
        (0, 'Propietari'),
        (1, 'Editor'),
        (2, 'Lector'),
    )
    usuari = models.ForeignKey(Usuari, on_delete=models.CASCADE, null=True)
    directori = models.ForeignKey(Directori, on_delete=models.CASCADE, null=True)
    rol = models.IntegerField(choices=ROLS)

class Arxiu(models.Model):
    nom = models.CharField(max_length=20)
    path = models.CharField(max_length=20)
    directori = models.ForeignKey(Directori, on_delete=models.CASCADE, null=True)