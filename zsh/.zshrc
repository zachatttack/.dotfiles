
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.zsh/agnoster-zsh-theme/agnoster.zsh-theme ] && source $HOME/.zsh/agnoster-zsh-theme/agnoster.zsh-theme


setopt prompt_subst
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim="nvim"
alias vt="cd /mnt/c/Users/zthomas/Documents/git/vt-anywhere/"
alias g="git"
alias gs="git status"


MYVIMRC="$HOME/.dotfiles/neovim/.vimrc"
export DOCKER_HOST="tcp://localhost:2375"

export PATH=/home/zach/.local/bin/:$PATH

source /home/zach/.zprofile

bindkey -v 
export KEYTIMEOUT=1


vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
} 

RPROMPT='${vim_mode}'


































source /home/zach/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

