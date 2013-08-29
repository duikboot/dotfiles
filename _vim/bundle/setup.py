#!/usr/bin/env python

import os

f = open('modules').readlines()
for line in f:
    l = line.split()[1]
    os.system('rm -rf %s' % l)
    print "installing %s...." % line
    os.system('git clone %s' % line)
