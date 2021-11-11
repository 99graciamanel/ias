from django.http.response import Http404, HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from backend.dbutils import folderdb
from backend.dbutils import userdb
from backend.dbutils import filedb
from django.http import FileResponse

from backend.dbutils import userinfolderdb

def addFolder(request):
    id = request.user.id
    name = request.POST['name']
    userdb.createFolder(id,name)
    return HttpResponseRedirect('/')

def deleteFolder(request):
    id = request.user.id
    idFolder = request.POST['id']
    role = userdb.getFolderRole(id,idFolder)
    if role == 0:
        folderdb.delete(idFolder)
        return HttpResponseRedirect('/')
    return Http404()

def editFolder(request):
    id = request.user.id
    idFolder = request.POST['id']
    nameFolder = request.POST['name']
    role = userdb.getFolderRole(id,idFolder)
    if role == 0:
        folderdb.edit(idFolder,nameFolder)
        return HttpResponseRedirect('/')
    return Http404()

def shareFolder(request):
    id = request.user.id
    role = 2
    idFolder = request.POST['idFolder']
    roleFolder = request.POST['role']
    username = request.POST['username']
    role = userdb.getFolderRole(id,idFolder)
    if username == request.user.username:
        return HttpResponse('Invalid user id')
    if roleFolder != '1' and roleFolder != '2':
        return HttpResponse('Invalid Role')
    if role == 0:
        userinfolderdb.add(username,idFolder,roleFolder)
        return HttpResponseRedirect('/shareFolder?id={}'.format(idFolder))
    return HttpResponse('Invalid Permission')

def unshareFolder(request):
    id = request.user.id
    role = 2
    idFolder = request.POST['idFolder']
    idUserFolder = request.POST['idUserFolder']
    folder = folderdb.get(idFolder)
    userFolder = userinfolderdb.get(idUserFolder)
    if userFolder.user.id == id:
        return HttpResponse('Invalid user id')
    if userFolder.folder.id != folder.id:
        return HttpResponse('Invalid folder id')
    role = userdb.getFolderRole(id,idFolder)
    if role == 0:
        userinfolderdb.delete(userFolder.id)
        return HttpResponseRedirect('/shareFolder?id={}'.format(idFolder))
    return HttpResponse('Invalid role')

def editshareFolder(request):
    id = request.user.id
    idFolder = request.POST['idFolder']
    role = userdb.getFolderRole(id,idFolder)
    roleFolder = request.POST['role']
    idUserFolder = request.POST['idUserFolder']
    folder = folderdb.get(idFolder)
    userFolder = userinfolderdb.get(idUserFolder)
    if userFolder.user.id == id:
        return HttpResponse('Invalid user id')
    if userFolder.folder.id != folder.id:
        return HttpResponse('Invalid folder id')
    if roleFolder != '1' and roleFolder != '2':
        return HttpResponse('Invalid Role')
    if role == 0:
        userinfolderdb.changeRole(idUserFolder,roleFolder)
        return HttpResponseRedirect('/shareFolder?id={}'.format(idFolder))
    return HttpResponse('Invalid Permission')

def addFile(request):
    id = request.user.id
    idFolder = request.POST['id']
    role = userdb.getFolderRole(id,idFolder)
    if role >= 2:
        return Http404()
    file = request.FILES['file']
    fileDB = folderdb.addFile(idFolder,file.name)
    fs = FileSystemStorage()
    fs.save(fileDB.path, file)
    return HttpResponseRedirect('/viewFolder?id={}'.format(idFolder))

def getFile(request):
    id = request.user.id
    idFolder = request.GET['idFolder']
    idFile = request.GET['idFile']
    if not userdb.inFolder(id,idFolder):
        return Http404()
    file = filedb.get(idFile)
    fs = FileSystemStorage()
    response = FileResponse(fs.open(file.path, 'rb'), content_type='application/force-download')
    response['Content-Disposition'] = 'attachment; filename="{}"'.format(file.name)
    return response

def deleteFile(request):
    id = request.user.id
    idFolder = request.POST['idFolder']
    idFile = request.POST['idFile']
    if userdb.getFolderRole(id,idFolder) >= 2:
        return Http404()
    file = filedb.get(idFile)
    fs = FileSystemStorage()
    fs.delete(file.path)
    filedb.delete(idFile)
    return HttpResponseRedirect('/viewFolder?id={}'.format(idFolder))

def editFile(request):
    id = request.user.id
    idFolder = request.POST['idFolder']
    idFile = request.POST['idFile']    
    if userdb.getFolderRole(id,idFolder) >= 2:
        return Http404()
    file = request.FILES['file']
    fileDB = filedb.get(idFile)
    fs = FileSystemStorage()
    fs.delete(fileDB.path)
    fileDB = filedb.edit(idFile,file.name)
    fs.save(fileDB.path, file)
    return HttpResponseRedirect('/viewFolder?id={}'.format(idFolder))