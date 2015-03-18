#!/usr/bin/env python

import os


def printing(text, module):
    print 80*"="
    print "%s %s...." % (text, module)


def update(module):
    l = module.split()[1]
    if not os.path.exists(l):

        printing("installing", module)

        if "bitbucket" in module:
            os.system('hg clone %s' % module)
        else:
            os.system('git clone %s' % module)
    else:
        os.chdir(l)
        printing("updating", module)
        if "bitbucket" in module:
            os.system('hg pull')
            os.system('hg up')
        else:
            os.system("git pull")
        os.chdir("..")
    print 80*"="


def main():
    with open('modules') as f:
        for module in f:
            if module.startswith("#"):
                continue
            update(module)


if __name__ == '__main__':
    main()
