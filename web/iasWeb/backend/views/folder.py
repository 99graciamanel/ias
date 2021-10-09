from django.http.response import Http404, HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse

from backend.dbutils import folderdb
from backend.dbutils import userdb

def addFolder(request):
    #Falta recollir ID
    id = 0
    name = request.POST['name']
    userdb.createFolder(id,name)
    return HttpResponseRedirect('/')

def deleteFolder(request):
    #Falta recollir ID
    id = 0
    idFolder = request.POST['id']
    role = userdb.getFolderRole(id,idFolder)
    if role == 0:
        folderdb.delete(idFolder)
        return HttpResponseRedirect('/')
    return Http404()

def editFolder(request):
    #Falta recollir ID
    id = 0
    idFolder = request.POST['id']
    nameFolder = request.POST['name']
    role = userdb.getFolderRole(id,idFolder)
    if role == 0:
        folderdb.edit(idFolder,nameFolder)
        return HttpResponseRedirect('/')
    return Http404()

def shareFolder(request):
    return HttpResponse('Test')

def unshareFolder(request):
    return HttpResponse('Test')

def editshareFolder(request):
    return HttpResponse('Test')
