#!/usr/bin/env python

import os
import subprocess
import time


def install(module):

    link, directory = module.split()
    s = [None, 'clone', link, directory]

    if "bitbucket" in module:
        s[0] = 'hg'
    else:
        s[0] = 'git'
    return subprocess.Popen(s)


def procs(module):
    directory = module.split()[1]
    if not os.path.exists(directory):
        return install(module)
    else:
        if "bitbucket" in module:
            proc = subprocess.Popen(['hg', 'pull', '-u', '--cwd', directory])
        else:
            proc = subprocess.Popen(["git", "-C", directory, "pull", "-v"])
    return proc


def main():
    with open('modules') as f:
        process_list = [procs(mod) for mod in f if not mod.startswith("#")]
    for proc in process_list:
        proc.communicate()


if __name__ == '__main__':
    start = time.time()
    main()
    end = time.time()
    print "Took %.3f seconds" % (end - start)
