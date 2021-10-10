from django.http.response import Http404, HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from backend.dbutils import folderdb
from backend.dbutils import userdb
from backend.dbutils import filedb
from django.http import FileResponse

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

def addFile(request):
    #Falta recollir ID
    id = 0
    idFolder = request.POST['id']
    role = userdb.getFolderRole(id,idFolder)
    if role >= 2:
        return Http404()
    file = request.FILES['file']
    fileDB = folderdb.addFile(idFolder,file.name)
    fs = FileSystemStorage()
    fs.save(fileDB.path, file)
    return HttpResponse(fileDB.path)

def getFile(request):
    #Falta recollir ID
    id = 0
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
    #Falta recollir ID
    id = 0
    idFolder = request.POST['idFolder']
    idFile = request.POST['idFile']
    if userdb.getFolderRole(id,idFolder) >= 2:
        return Http404()
    file = filedb.get(idFile)
    fs = FileSystemStorage()
    fs.delete(file.path)
    filedb.delete(idFile)
    return HttpResponse(file.path)

def editFile(request):
    #Falta recollir ID
    id = 0
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
    return HttpResponse(fileDB.path)
