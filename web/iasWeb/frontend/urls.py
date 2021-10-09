from django.urls import path

from . import views

urlpatterns = [
    path('', views.index),
    path('newFolder', views.newFolder),
    path('editFolder', views.editFolder),
    path('viewFolder', views.viewFolder),
]
