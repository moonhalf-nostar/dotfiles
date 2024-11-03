#!/bin/bash

set -eu

BASE_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
DOTFILES_DIR="$BASE_DIR"/dotfiles
BAK_TIME=$(date +%F_%T.%N)

main() {
    cp_dotfiles .config/nvim
    cp_dotfiles .config/tmux
    cp_dotfiles .config/byobu
    cp_dotfiles .local/share/nvim
}

# check_ctools() {
#     # check c tools first
#     if ! command -v gcc make &> /dev/null; then
#         echo please install gcc, make
#         exit 1
#     fi
# }

cp_dotfiles() {
    # copy file or dirs in dotfiles to $HOME
    # if file or dirs already exist, backup them beform copy
    # if parent dirs not exist, make parents
    # BUG: ** make sure the argument not end with `/` **
    par_dir=$(dirname "$1")
    if [ ! -d "$par_dir" ]; then
        echo parent dir "'$par_dir'" not exists, create
        mkdir -p "$par_dir"
    fi
    src_dir="$HOME"/"$1"
    if [ -d "$src_dir" ]; then
        bak_dir="$src_dir""$BAK_TIME".bak
        echo found "$src_dir" dir, move to "$bak_dir"
        mv "$src_dir" "$bak_dir"
    fi
    cp -r "$DOTFILES_DIR"/"$1" "$src_dir"
    echo "done cp"
}

main
