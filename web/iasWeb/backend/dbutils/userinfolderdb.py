from backend.models import UserInFolder
from backend.dbutils import folderdb
from backend.dbutils import userdb

def get(id):
    ufList = UserInFolder.objects.filter(id=id)
    if len(ufList) == 1:
        return ufList[0]
    else:
        raise ValueError("UserInFolder does not exist")

def add(username,folderId,role):
    user = userdb.getName(username)
    folder = folderdb.get(folderId)
    uf = UserInFolder(user=user,folder=folder,role=role)
    uf.save()
    user.userinfolder_set.add(uf)
    folder.userinfolder_set.add(uf)
    return uf

def delete(id):
    uf = UserInFolder.objects.filter(id=id)
    if len(uf) == 1:
        uf[0].delete()
    else:
        raise ValueError("UserInFolder does not exist")

def changeRole(id,role):
    uf = UserInFolder.objects.filter(id=id)
    if len(uf) == 1:
        uf[0].role = role
        uf[0].save()
        return uf
    else:
        raise ValueError("UserInFolder does not exist")