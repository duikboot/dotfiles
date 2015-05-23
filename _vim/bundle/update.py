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


def procs(module):
    p = []
    directory = module.split()[1]
    if "bitbucket" in module:
        p.append(['hg', 'pull', '--cwd', directory])
        p.append(['hg', 'up', '--cwd', directory])
    else:
        p.append(["git", "-C", directory, "pull"])
    return p


def main():
    with open('modules') as f:
        process_list = [procs(module) for module in f if not module.startswith("#")]
    print process_list


if __name__ == '__main__':
    main()
