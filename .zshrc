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
source /opt/intel/oneapi/setvars.sh

export PATH="$HOME/.scripts:$HOME/.dotnet:$HOME/.cargo/bin:/usr/sbin:/usr/local/cuda-12.6/bin:$PATH:$HOME/.local/bin:/opt/intel/oneapi/compiler/2025.3/bin"
export CPATH="$HOME/.local/include"
export LIBRARY_PATH="$HOME/.local/lib:"
export LD_RUN_PATH="$HOME/.local/lib"
export LD_PATH="$HOME/.local/lib"
export LD_LIBRARY_PATH="$HOME/.local/lib"

if [[ -o login ]]; then
    startx
fi
