#!/bin/sh

DOT_FOLDERS="tmux git zsh"

for folder in $DOT_FOLDERS; do
    echo "[+] Folder :: $folder"
    stow -t $HOME $folder 
done

# Reload shell once installed
echo "[+] Reload shell to see effects..."
