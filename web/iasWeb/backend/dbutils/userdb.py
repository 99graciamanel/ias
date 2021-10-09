from backend.models import User
from backend.models import Folder
from backend.models import UserInFolder

def get(keycloak_id):
    userList = User.objects.filter(keycloak_id=keycloak_id)
    if len(userList) == 1:
        return userList[0]
    else:
        raise ValueError("User does not exist")

def add(keycloak_id,name):
    user = User(keycloak_id=keycloak_id,name=name)
    user.save()
    return user

def delete(keycloak_id):
    userList = User.objects.filter(keycloak_id=keycloak_id)
    if len(userList) == 1:
        userList[0].delete()
    else:
        raise ValueError("User does not exist")

def edit(keycloak_id,name):
    userList = User.objects.filter(keycloak_id=keycloak_id)
    if len(userList) == 1:
        userList[0].name = name
        userList[0].update()
        return userList[0]
    else:
        raise ValueError("User does not exist")

def createFolder(keycloak_id,name):
    user = get(keycloak_id)
    folder = Folder(name=name)
    folder.save()
    uf = UserInFolder(user=user,folder=folder,role=0)
    uf.save()
    user.userinfolder_set.add(uf)
    return folder

def getFolders(keycloak_id):
    user = get(keycloak_id)
    folders = []
    for uf in user.userinfolder_set.all():
        folders.append(uf)
    return folders

def getFolderRole(keycloak_id,folder_id):
    user = get(keycloak_id)
    ufList = user.userinfolder_set.filter(folder_id=folder_id)
    if len(ufList) != 1:
        raise ValueError("UserInFolder does not exist")
    return ufList[0].role


