
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f $HOME/.zsh/agnoster-zsh-theme/agnoster.zsh-theme ] && source $HOME/.zsh/agnoster-zsh-theme/agnoster.zsh-theme
setopt prompt_subst

alias vim="nvim"
alias vt="cd /mnt/c/Users/zthomas/Documents/git/vt-anywhere/"

alias g="git"
alias gs="git status"

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

MYVIMRC="$HOME/.dotfiles/neovim/.vimrc"
export DOCKER_HOST="tcp://localhost:2375"

export PATH=/home/zach/.local/bin/:$PATH

source /home/zach/.zprofile
