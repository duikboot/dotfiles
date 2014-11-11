#!/usr/bin/env python

import os

f = open('modules').readlines()
for line in f:
    l = line.split()[1]
    if not os.path.exists(l):
        print "installing %s...." % line
        if "bitbucket" in line:
            os.system('hg clone %s' % line)
        else:
            os.system('git clone %s' % line)
    else:
        os.chdir(l)
        print "updating %s...." % line
        if "bitbucket" in line:
            os.system('hg pull')
            os.system('hg up')
        else:
            os.system("git pull")
        os.chdir("..")
