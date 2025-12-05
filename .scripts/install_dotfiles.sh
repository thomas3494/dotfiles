#!/bin/sh

if [ "$#" -ne 0 ]; then
    printf 'Usage: %s\n' "$0" >&2
    exit 1
fi

git clone --bare git@github.com:thomas3494/dotfiles.git "$HOME"/.dotfiles

config()
{
    git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

config checkout
if ! config checkout
then
    echo "Checked out dotfiles from git@github.com:thomas3494/dotfiles.git";
fi

config checkout
config config status.showUntrackedFiles no
