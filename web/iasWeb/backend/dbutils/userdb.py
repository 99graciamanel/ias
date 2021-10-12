from django.contrib.auth.models import User
from backend.models import Folder
from backend.models import UserInFolder

def get(id):
    userList = User.objects.filter(id=id)
    if len(userList) == 1:
        return userList[0]
    else:
        raise ValueError("User does not exist")

def getName(name):
    userList = User.objects.filter(username=name)
    if len(userList) == 1:
        return userList[0]
    else:
        raise ValueError("User does not exist")

def createFolder(id,name):
    user = get(id)
    folder = Folder(name=name)
    folder.save()
    uf = UserInFolder(user=user,folder=folder,role=0)
    uf.save()
    user.userinfolder_set.add(uf)
    return folder

def getFolders(id):
    user = get(id)
    folders = []
    for uf in user.userinfolder_set.all():
        folders.append(uf)
    return folders

def getFolderRole(id,folder_id):
    user = get(id)
    ufList = user.userinfolder_set.filter(folder_id=folder_id)
    if len(ufList) != 1:
        raise ValueError("UserInFolder does not exist")
    return ufList[0].role

def inFolder(keycloak_id,folder_id):
    user = get(keycloak_id)
    ufList = user.userinfolder_set.filter(folder_id=folder_id)
    return len(ufList) == 1