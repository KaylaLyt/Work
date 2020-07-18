import sys, os, string, pathlib

import time

SVNLOOK = 'svnlook.exe'
#exts = [".doc", ".xls", ".ppt", ".docx", ".xlsx", ".pptx", ".jpg", "vsd", "bmp"]
error_collect = []

def printerror(msg):
    global error_collect
    error_collect.append(msg)
    print(msg)

def checkNeedsLock(repos):

    pathtext = pathlib.Path(repos).read_text()
    lines = pathtext.split('\n')

    list_prefab = list()
    list_meta = list()
    printerror("0")
    for ln in lines:

        fname =ln.strip()

        name = os.path.splitext(fname)[0]  #前缀
        ext = os.path.splitext(fname)[1]   #后缀

        if ext == ".meta":
            if os.path.splitext(name)[1] == ".prefab":
                list_meta.append(os.path.splitext(name)[0])
        if ext == ".prefab":
            list_prefab.append(name)
    list_meta.sort()
    list_prefab.sort()
    if list_meta != list_prefab:
        sys.exit(1)
    sys.exit(0)




def main(repos):
    checkNeedsLock(repos)
    exit(0)


if __name__ == '__main__':
    if len(sys.argv) < 3:
        sys.stderr.write("Usage: %s REPOS TXN/n" % (sys.argv[0]))
        exit(1)
    else:
        main(sys.argv[1])

