[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_COMPLETION_OPTS='--tiebreak=begin,length'

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
setopt histignorealldups sharehistory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history

alias ll='ls -lh --color'
alias ls='ls --color'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse| xargs nvim'
alias tmuxn='tmux -2 new -s'
alias mux='pgrep -vx tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'

alias t='~/bin/tmux-sessionizer'

alias vi='vim'
alias e='nvim'

if [ -f .venv/bin/activate ];
then
  source .venv/bin/activate
fi
if [ -f ENV/bin/activate ];
then
  source ENV/bin/activate
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

autoload -U edit-command-line
zle -N edit-command-line
bindkey "^xe" edit-command-line
bindkey "^x^e" edit-command-line

autoload -Uz compinit; compinit
fpath=($DOTFILES/config/zsh/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

if [ -f ~/.envs ];
then
    source ~/.envs
fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/arjen/Programs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/arjen/Programs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/arjen/Programs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/arjen/Programs/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /var/lib/snapd/snap/terraform/711/terraform terraform

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/arjen/.lmstudio/bin"
