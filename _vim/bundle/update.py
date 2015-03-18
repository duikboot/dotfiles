#!/usr/bin/env python

import os


def printing(text, module):
    print 80*"="
    print "%s %s...." % (text, module)


def install(module):
    printing("installing", module)

    if "bitbucket" in module:
        os.system('hg clone %s' % module)
    else:
        os.system('git clone %s' % module)


def update(module):
    directory = module.split()[1]
    if not os.path.exists(directory):
        install(module)

    else:
        os.chdir(directory)
        printing("updating", module)
        if "bitbucket" in module:
            os.system('hg pull')
            os.system('hg up')
        else:
            os.system("git pull")
        os.chdir("..")


def main():
    with open('modules') as f:
        for line in f:
            if line.startswith("#"):
                continue
            update(line)
            print 80*"="


if __name__ == '__main__':
    main()
