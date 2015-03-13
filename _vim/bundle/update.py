#!/usr/bin/env python

import os


# Make wrapper for printing

def printing(text, line):
    print(80*"=")
    print("%s %s...." % (text, line))


def update():
    with open('modules') as f:
        for line in f:
            l = line.split()[1]
            if not os.path.exists(l):
                if line.startswith("#"):
                    continue

                printing("installing", line)

                if "bitbucket" in line:
                    os.system('hg clone %s' % line)
                else:
                    os.system('git clone %s' % line)
                print 80*"="
            else:
                os.chdir(l)
                printing("updating", line)
                if "bitbucket" in line:
                    os.system('hg pull')
                    os.system('hg up')
                else:
                    os.system("git pull")
                print 80*"="
                os.chdir("..")


if __name__ == '__main__':
    update()
