#!/bin/zsh

# for editing commands
autoload -U select-word-style
select-word-style bash
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^U' backward-kill-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# prompt
autoload -U colors && colors
PS1="%{$fg[green]%}%n@%m%{$fg[blue]%}:%~%{$reset_color%}$ "

# No warning when deleting everything in a directory
setopt rm_star_silent

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='grep -F --color=auto'
    alias egrep='grep -E --color=auto'
fi

source .envs
source .aliases
ls /opt/intel/oneapi/setvars.sh > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
    source /opt/intel/oneapi/setvars.sh > /dev/null 2> /dev/null
fi

if [[ -o login ]]; then
    startx
fi
