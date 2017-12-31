#!/usr/bin/env python3.6

import os
import shutil
import subprocess
import time


def clone(link, directory):
    """
    Create clone command.
    """
    command = [None, 'clone', link, directory]

    if "bitbucket" in link:
        command[0] = 'hg'
    else:
        command[0] = 'git'
        command.append('-v')
    return subprocess.Popen(command)


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


def is_obsolete(file_):
    """Check if `file_` is a hidden file or a directory"""
    return not(file_.startswith(".") or os.path.isfile(file_))


def list_processes():
    """ Create list of processes. """
    with open('modules') as file_:
        # Create process_list but filter commented lines.
        process_list = [procs(mod) for mod in file_ if not mod.startswith("#")]
        file_.seek(0)
        # Create list of directories from file
        dirs = [(mod.split()[-1]) for mod in file_ if not mod.startswith("#")]

        # Filter directories which are obsolete
        obsolete_dirs = (d for d in os.listdir('.')
                         if is_obsolete(d) and d not in dirs)
    return process_list, obsolete_dirs


def main():
    """
    Main runner
    """
    process_list, obsolete_dirs = list_processes()
    [proc.communicate() for proc in process_list]
    to_remove = [d for d in obsolete_dirs if not os.path.islink(d)]
    [shutil.rmtree(d) for d in to_remove]
    print("removed following directories", to_remove)


if __name__ == '__main__':
    START = time.time()
    main()
    END = time.time()
    print("Took %.3f seconds" % (END - START), end='\n\n')
