"""
This file is executed when the Python interactive shell is started if
$PYTHONSTARTUP is in your environment and points to this file. It's just
regular Python commands, so do what you will. Your ~/.inputrc file can greatly
complement this file.

"""
import os

try:
    import readline
    import rlcompleter
    import atexit
except ImportError:
    print("You need readline, rlcompleter, and atexit")

readline.parse_and_bind("tab: complete")
# readline.parse_and_bind ("bind ^I rl_complete")

class Completer(object):
    def __init__(self):
        # Enable a History
        self.HISTFILE=os.path.expanduser("%s/.pyhistory" % os.environ["HOME"])

        # Read the existing history if there is one
        if os.path.exists(self.HISTFILE):
            readline.read_history_file(self.HISTFILE)

        # Set maximum number of items that will be written to the history file
        readline.set_history_length(300)
        atexit.register(self.savehist)

    def savehist(self):
        import readline
        readline.write_history_file(self.HISTFILE)


c = Completer()
