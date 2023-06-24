#!/bin/bash


# Check if git/tmux/zsh are installed
# Prompt what to do if not



# Clone into ~/.dotfiles

git clone https://github.com/aljazmedic/dotfiles ~/.dotfiles

cd ~/.dotfiles && ./make-links.sh
