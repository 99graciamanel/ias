from django.http.response import Http404, HttpResponse
from django.shortcuts import render
from django.template import loader
from backend.dbutils import userdb,folderdb,filedb
from backend.dbutils import userinfolderdb

# Create your views here.
def index(request):
    id = request.user.id
    context = {'folders':userdb.getFolders(id)}
    return render(request,'frontend/home.html',context)

def newFolder(request):
    return render(request, 'frontend/newFolder.html')

def editFolder(request):
    id = request.user.id
    folderId = request.GET['id']
    folder = folderdb.get(folderId)
    if userdb.getFolderRole(id,folderId) != 0:
        return Http404()
    context = {'folder':folder} 
    return render(request, 'frontend/editFolder.html',context)

def viewFolder(request):
    id = request.user.id
    folderId = request.GET['id']
    role = userdb.getFolderRole(id,folderId)
    folder = folderdb.get(folderId)
    files = folderdb.getFiles(folderId)
    context = {'folder':folder,'files':files,'role':role}
    return render(request, 'frontend/viewFolder.html',context)

def newFile(request):
    id = request.user.id
    folderId = request.GET['id']
    role = userdb.getFolderRole(id,folderId)
    if role >= 2:
        return Http404()
    folder = folderdb.get(folderId)
    context = {'folder':folder}
    return render(request, 'frontend/newFile.html',context)

def editFile(request):
    id = request.user.id
    folderId = request.GET['idFolder']
    fileId = request.GET['idFile']
    role = userdb.getFolderRole(id,folderId)
    if role >= 2:
        return Http404()
    folder = folderdb.get(folderId)
    file = filedb.get(fileId)
    context = {'folder':folder,'file':file}
    return render(request, 'frontend/editFile.html',context)

def shareFolder(request):
    id = request.user.id
    folderId = request.GET['id']
    folder = folderdb.get(folderId)
    role = userdb.getFolderRole(id,folderId)
    if role != 0:
        return Http404()
    users = folderdb.getUsers(folderId)
    context = {'users':users,'folder':folder}
    return render(request, 'frontend/shareFolder.html',context)

def shareUser(request):
    id = request.user.id
    folderId = request.GET['id']
    folder = folderdb.get(folderId)
    role = userdb.getFolderRole(id,folderId)
    if role != 0:
        return Http404()
    context = {'folder':folder}
    return render(request, 'frontend/shareUser.html',context)

def editShareUser(request):
    id = request.user.id
    folderId = request.GET['idFolder']
    userFolderId = request.GET['idUserFolder']
    folder = folderdb.get(folderId)
    uf = userinfolderdb.get(userFolderId)
    role = userdb.getFolderRole(id,folderId)
    if role != 0:
        return Http404()
    context = {'folder':folder,'user':uf}
    return render(request, 'frontend/editshareUser.html',context)