import sys
import re
from os import popen
from os.path import join

def err(msg):
    sys.stderr.write(msg + '\n')


svnBin = sys.argv[1]
svnRepos = sys.argv[2]
svnTxn = sys.argv[3]

errMsgTable = []

svnlook = join(svnBin, 'svnlook.exe')
svnlook_changed = '"%s" changed -t %s %s' % (svnlook, svnTxn, svnRepos)


# skip deleting file
def filt(x):
    #if x[:2] != 'D ':
    return x[2:].strip()


changedFiles = map(filt, popen(svnlook_changed).readlines())
list_prefab = list()
list_meta = list()
count_prefab = 0
count_meta = 0
for relPath in changedFiles:

    if relPath.endswith('.meta'):
        cutPath = relPath[:-5]
        if cutPath.endswith('.prefab'):
            count_meta += 1
            list_meta.append(cutPath[:-7])
    if relPath.endswith('.prefab'):
        count_prefab += 1
        list_prefab.append(relPath[:-7])

if count_meta==count_prefab:
    list_meta.sort()
    list_prefab.sort()
    if list_meta == list_prefab:
        sys.exit(0)
    else:
        sys.exit(1)
sys.exit(1)