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
    file.path = str(file.id)
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
        fileList[0].path = str(fileList[0].id)
        fileList[0].save()
        return fileList[0]
    else:
        raise ValueError("File does not exist")