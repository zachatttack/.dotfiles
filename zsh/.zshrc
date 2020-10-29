# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zach/.oh-my-zsh"

ZSH_THEME="agnoster"
#ZSH_THEME="afowler"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#alias vim="nvim"
alias vt="cd /mnt/c/Users/zthomas/Documents/git/vt-anywhere/"

alias g="git"
alias gs="git status"

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

MYVIMRC="$HOME/.dotfiles/neovim/.vimrc"
export DOCKER_HOST="tcp://localhost:2375"

export PATH=/home/zach/.local/bin/:$PATH

