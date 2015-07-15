#!/usr/bin/env python3

import os
import subprocess
import shutil
import time


def clone(link, directory):
    """
    Create clone command.
    """
    s = [None, 'clone', link, directory]

    if "bitbucket" in link:
        s[0] = 'hg'
    else:
        s[0] = 'git'
        s.append('-v')
    return subprocess.Popen(s)


def update(link, directory):
    """
    Create update command.
    """
    if "bitbucket" in link:
        return subprocess.Popen(['hg', 'pull', '-u', '--cwd', directory])
    elif "git" in link:
        return subprocess.Popen(["git", "-C", directory, "pull", "-v"])


def procs(module):
    """
    Return update or clone subprocess object.
    """
    link, directory = module.split()
    if not os.path.exists(directory):
        return clone(link, directory)

    return update(link, directory)


def main():
    # dirs = os.listdir('.')
    with open('modules') as f:
        # Create process_list but filter commented lines.
        process_list = [procs(mod) for mod in f if not mod.startswith("#")]
        f.seek(0)
        # create list with directories which are commented
        obsolete_dirs = [(mod.split()[-1]) for mod in f if mod.startswith("#")
                         if os.path.exists(mod.split()[-1])]
    _ = [proc.communicate() for proc in process_list]
    print(obsolete_dirs)
    _ = [shutil.rmtree(d) for d in obsolete_dirs]


if __name__ == '__main__':
    start = time.time()
    main()
    end = time.time()
    print("Took %.3f seconds" % (end - start), end="\n\n")
