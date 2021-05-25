# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zach/.oh-my-zsh"

ZSH_THEME="rgm"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

 source $ZSH/oh-my-zsh.sh
[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim="nvim"
alias e="explorer.exe ."
#alias vt="cd /mnt/c/Users/zthomas/Documents/git/vt-anywhere/"

alias doc="cd /mnt/c/Users/zthomas/Documents/"
alias docgit="cd /mnt/c/Users/zthomas/Documents/git"
alias poc="cd /mnt/c/Vector/D03/vector-poc/Appl/"

alias g="git"
alias gs="git status"
alias cmd="cmd.exe /c"

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

MYVIMRC="$HOME/.dotfiles/neovim/.vimrc"
export DOCKER_HOST="tcp://localhost:2375"

export PATH=/home/zach/.local/bin/:$PATH
export PATH=/mnt/c/cygwin64/bin/:$PATH

export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"
LS_COLORS="ow=01;36;40" && export LS_COLORS
