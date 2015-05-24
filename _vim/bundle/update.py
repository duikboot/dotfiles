#!/usr/bin/env python

import os
import subprocess
import time


def install(link, directory):

    s = [None, 'clone', link, directory]

    if "bitbucket" in link:
        s[0] = 'hg'
    else:
        s[0] = 'git'
        s.append('-v')
    return subprocess.Popen(s)


def update(link, directory):
    if "bitbucket" in link:
        return subprocess.Popen(['hg', 'pull', '-u', '--cwd', directory])
    return subprocess.Popen(["git", "-C", directory, "pull", "-v"])


def procs(module):
    link, directory = module.split()
    if not os.path.exists(directory):
        return install(link, directory)

    return update(link, directory)


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
