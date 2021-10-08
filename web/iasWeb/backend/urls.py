from django.urls import path

from . import views

urlpatterns = [
    path('folder/add', views.addFolder, name='addFolder'),
    path('folder/delete', views.deleteFolder, name='deleteFolder'),
    path('folder/share', views.shareFolder, name='shareFolder'),
    path('folder/unshare', views.unshareFolder, name='unshareFolder'),
    path('folder/editshare', views.editshareFolder, name='editshareFolder'),
]
