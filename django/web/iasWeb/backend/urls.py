from django.urls import path
from django.contrib.auth.decorators import login_required
from . import views

urlpatterns = [
    path('folder/add', login_required(views.addFolder), name='addFolder'),
    path('folder/delete', login_required(views.deleteFolder), name='deleteFolder'),
    path('folder/edit', login_required(views.editFolder), name='editFolder'),
    path('folder/share', login_required(views.shareFolder), name='shareFolder'),
    path('folder/unshare', login_required(views.unshareFolder), name='unshareFolder'),
    path('folder/editshare', login_required(views.editshareFolder), name='editshareFolder'),
    path('folder/addFile', login_required(views.addFile), name='addFile'),
    path('folder/getFile', login_required(views.getFile), name='getFile'),
    path('folder/deleteFile', login_required(views.deleteFile), name='deleteFile'),
    path('folder/editFile', login_required(views.editFile), name='editFile'),
]
