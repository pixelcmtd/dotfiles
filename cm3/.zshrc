#!/bin/zsh
source ~/.env

autoload -U compaudit compinit
compinit -u -C -d "$HOME/.zcompdump-$ZSH_VERSION"

zmodload -i zsh/complist
WORDCHARS=''
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $HOME/.cache/oh-my-zsh-cache

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz is-at-least
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
setopt long_list_jobs
setopt interactivecomments

autoload -U colors && colors
zstyle ':completion:*' list-colors "Gxfxcxdxbxegedabagacad"
setopt auto_cd
setopt multios
setopt prompt_subst

function colored() {
        env LESS_TERMCAP_mb=$'\e[1;31m' \
            LESS_TERMCAP_md=$'\e[1;31m' \
            LESS_TERMCAP_me=$'\e[0m' \
            LESS_TERMCAP_se=$'\e[0m' \
            LESS_TERMCAP_so=$'\e[1;44;33m' \
            LESS_TERMCAP_ue=$'\e[0m' \
            LESS_TERMCAP_us=$'\e[1;32m' _NROFF_U=1 "$@"
}
function man() { colored man "$@" ; }

source "$HOME/.zshtheme"

alias v="$VISUAL"
alias V="sudo $EDITOR"
alias mv="mv -i"

alias o="`type xdg-open >/dev/null && echo xdg-open || echo open`"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -lAFh'
alias ls='ls --color=auto'

alias grep="grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias gr="grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn -R"

alias zshtheme="$VISUAL $HOME/.zshtheme"
alias zshrc="$VISUAL $HOME/.zshrc"
alias vimrc="$VISUAL $HOME/.vimrc"

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g J='| jq'
alias -g L='| $PAGER'
alias -g S='| sort'
alias -g U='| uniq'
alias -g C='| `type xclip >/dev/null && echo xclip || echo pbcopy`'
alias -g NE='2>/dev/null'
alias -g NUL='>/dev/null'

alias diff='git diff --no-index'
alias tmp='pushd ; cd $(mktemp -d)'

source ~/src/pixelcmtd/dotfiles/base/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
