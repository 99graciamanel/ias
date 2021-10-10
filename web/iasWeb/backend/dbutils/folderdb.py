from backend.models import Folder
from backend.dbutils import filedb

def get(id):
    folderList = Folder.objects.filter(id=id)
    if len(folderList) == 1:
        return folderList[0]
    else:
        raise ValueError("Folder does not exist")

def add(name):
    folder = Folder(name=name)
    folder.save()
    return folder

def delete(id):
    folderList = Folder.objects.filter(id=id)
    if len(folderList) == 1:
        folderList[0].delete()
    else:
        raise ValueError("Folder does not exist")

def edit(id,name):
    folderList = Folder.objects.filter(id=id)
    if len(folderList) == 1:
        folderList[0].name = name
        folderList[0].save()
    else:
        raise ValueError("Folder does not exist")

def addFile(id,name):
    folderList = Folder.objects.filter(id=id)
    if len(folderList) == 1:
        folder = folderList[0]
        file = filedb.add(name)
        folder.file_set.add(file)
        return file
    else:
        raise ValueError("Folder does not exist")

def getFiles(id):
    folderList = Folder.objects.filter(id=id)
    if len(folderList) == 1:
        folder = folderList[0]
        return folder.file_set.all()
    else:
        raise ValueError("Folder does not exist")