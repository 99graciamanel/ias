from backend.models import UserInFolder

def add(user,folder,role):
    uf = UserInFolder(user=user,folder=folder,role=role)
    uf.save()
    return uf

def delete(id):
    uf = UserInFolder.objects.filter(id=id)
    if len(UserInFolder) == 1:
        UserInFolder[0].delete()
    else:
        raise ValueError("UserInFolder does not exist")

def changeRole(id,role):
    uf = UserInFolder.objects.filter(id=id)
    if len(UserInFolder) == 1:
        UserInFolder[0].role = role
        UserInFolder[0].update()
        return uf
    else:
        raise ValueError("UserInFolder does not exist")