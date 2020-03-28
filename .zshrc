# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zach/.oh-my-zsh"

ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias vt="/c/Users/zthomas/Documents/git/vt-anywhere/"
alias g="git"

if [ -f /$HOME/.cargo/env] ]; then
    source $HOME/.cargo/env
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

MYVIMRC="$HOME/.dotfiles/nvim/nvimrc"
DOCKER_HOST="tcp://localhost:2375"


