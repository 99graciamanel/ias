# Generated by Django 3.2.7 on 2021-10-08 14:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Folder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('keycloak_id', models.CharField(max_length=200)),
                ('name', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='File',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('path', models.CharField(max_length=20)),
                ('directory', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='backend.folder')),
            ],
        ),
        migrations.CreateModel(
            name='UserInFolder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role', models.IntegerField(choices=[(0, 'Owner'), (1, 'Editor'), (2, 'Guest')])),
                ('Folder', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='backend.folder')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='backend.user')),
            ],
            options={
                'unique_together': {('user', 'Folder')},
            },
        ),
    ]