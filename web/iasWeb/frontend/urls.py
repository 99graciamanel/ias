from django.urls import path
from django.contrib.auth.decorators import login_required

from . import views

urlpatterns = [
    path('', login_required(views.index)),
    path('newFolder', login_required(views.newFolder)),
    path('editFolder', login_required(views.editFolder)),
    path('viewFolder', login_required(views.viewFolder)),
    path('newFile', login_required(views.newFile)),
    path('editFile', login_required(views.editFile)),
    path('shareFolder', login_required(views.shareFolder)),
    path('shareUser', login_required(views.shareUser)),
]
