[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ll='ls -lah'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
export FZF_COMPLETION_OPTS='--tiebreak=begin,length'

alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse| xargs nvim'
alias tmuxn='tmux -2 new -s'
alias mux='pgrep -vx tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'

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

autoload -Uz compinit; compinit
fpath=($DOTFILES/config/zsh/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup
