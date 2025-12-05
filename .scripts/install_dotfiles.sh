#!/bin/sh

if [ "$#" -ne 0 ]; then
    printf 'Usage: %s\n' "$0" >&2
    exit 1
fi

git clone --bare git@github.com:thomas3494/dotfiles.git $HOME/.dotfiles

function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles from git@github.com:thomas3494/dotfiles.git";
  else
    echo "Moving existing dotfiles to ~/.dotfiles-backup";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi

config checkout
config config status.showUntrackedFiles no
