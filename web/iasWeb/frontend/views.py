from django.http.response import Http404, HttpResponse
from django.shortcuts import render
from django.template import loader
from backend.dbutils import userdb,folderdb

# Create your views here.
def index(request):
    # Aqui fa falta recollir l'identificador de l'usuari
    id = 0
    context = {'folders':userdb.getFolders(id)} 
    return render(request,'frontend/home.html',context)

def newFolder(request):
    return render(request, 'frontend/newFolder.html')

def editFolder(request):
    # Aqui fa falta recollir l'identificador de l'usuari
    id = 0
    folderId = request.GET['id']
    folder = folderdb.get(folderId)
    if userdb.getFolderRole(id,folderId) != 0:
        return Http404()
    context = {'folder':folder} 
    return render(request, 'frontend/editFolder.html',context)

def viewFolder(request):
    # Aqui fa falta recollir l'identificador de l'usuari
    id = 0
    folderId = request.GET['id']
    role = userdb.getFolderRole(id,folderId)
    folder = folderdb.get(folderId)
    files = folderdb.getFiles(folderId)
    context = {'folder':folder,'files':files,'role':role}
    return render(request, 'frontend/viewFolder.html',context)