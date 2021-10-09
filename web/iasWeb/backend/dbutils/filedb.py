from backend.models import File

def get(id):
    fileList = File.objects.filter(id=id)
    if len(fileList) == 1:
        return fileList[0]
    else:
        raise ValueError("File does not exist")

def add(name):
    file = File(name=name)
    file.save()
    file.path = str(file.id)+name
    file.save()
    return file

def delete(id):
    fileList = File.objects.filter(id=id)
    if len(fileList) == 1:
        fileList[0].delete()
    else:
        raise ValueError("File does not exist")

def edit(id,name):
    fileList = File.objects.filter(id=id)
    if len(fileList) == 1:
        fileList[0].name = name
        fileList[0].update()
        return fileList[0]
    else:
        raise ValueError("File does not exist")