#!/bin/sh

# Check if --wsl in arguments
WSL=false
while [ $# -gt 0 ]; do
    case "$1" in
    --wsl)
        echo "[+] WSL mode"
        WSL=true
        ;;
    *)
        echo "[-] Invalid argument: $1"
        exit 1
        ;;
    esac
    shift
done

ALL=$(ls ./stow)

DOT_FOLDERS="tmux git zsh pwninit fonts lf nvm"
if [ $WSL ]; then
    DOT_FOLDERS="$DOT_FOLDERS $(echo $ALL | grep -o "wsl-.*")"
fi

for folder in $DOT_FOLDERS; do
    echo "[+] Folder :: $folder"
    stow -t $HOME -d ./stow/ $folder -v -R
done

# Reload shell once installed
echo "[+] Reload shell to see effects..."
