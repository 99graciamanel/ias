from django.urls import path

from . import views

urlpatterns = [
    path('folder/add', views.addFolder, name='addFolder'),
    path('folder/delete', views.deleteFolder, name='deleteFolder'),
    path('folder/edit', views.editFolder, name='editFolder'),
    path('folder/share', views.shareFolder, name='shareFolder'),
    path('folder/unshare', views.unshareFolder, name='unshareFolder'),
    path('folder/editshare', views.editshareFolder, name='editshareFolder'),
    path('folder/addFile', views.addFile, name='addFile'),
    path('folder/getFile', views.getFile, name='getFile'),
    path('folder/deleteFile', views.deleteFile, name='deleteFile'),
    path('folder/editFile', views.editFile, name='editFile'),
]
