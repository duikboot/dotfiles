#!/usr/bin/env python3.5

import os
import shutil
import subprocess
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


def is_obsolete(f):
    if f.startswith(".") or os.path.isfile(f):
        return False
    return True


def list_processes():
    # dirs = os.listdir('.')
    with open('modules') as f:
        # Create process_list but filter commented lines.
        process_list = [procs(mod) for mod in f if not mod.startswith("#")]
        f.seek(0)
        # create list with directories which are commented
        dirs_ = [(mod.split()[-1]) for mod in f if not mod.startswith("#")]

        obsolete_dirs = [d for d in os.listdir('.')
                         if is_obsolete(d) and d not in dirs_]
    return process_list, obsolete_dirs


def main():
    process_list, obsolete_dirs = list_processes()
    [proc.communicate() for proc in process_list]
    print(obsolete_dirs)
    [shutil.rmtree(d) for d in obsolete_dirs]


if __name__ == '__main__':
    start = time.time()
    main()
    end = time.time()
    print("Took %.3f seconds" % (end - start), end="\n\n")
