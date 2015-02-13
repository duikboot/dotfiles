#!/usr/bin/env python

import os

f = open('modules').readlines()
for line in f:
    l = line.split()[1]
    os.system('rm -rf %s' % l)
    if line.startswith("#"):
        continue
    print "installing %s...." % line
    if "bitbucket" in line:
        os.system('hg clone %s' % line)
    else:
        os.system('git clone %s' % line)
