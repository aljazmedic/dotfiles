#!/bin/sh

DOT_FOLDERS="tmux git zsh pwninit fonts lf nvm"

for folder in $DOT_FOLDERS; do
    echo "[+] Folder :: $folder"
    stow -t $HOME -d ./stow/ $folder -v -R
done

# Reload shell once installed
echo "[+] Reload shell to see effects..."
