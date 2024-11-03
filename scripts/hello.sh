#!/bin/bash

set -eu

function hello() {
    # hello world
    echo hello
    read -rp "var zwh: " zwh
    echo "$zwh"
}

hello

command -v tmux &> /dev/null && echo y || echo n
