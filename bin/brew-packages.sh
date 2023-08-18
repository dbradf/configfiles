#!/usr/bin/env bash

PACKAGE=(
    htop
    jq
    neovim
    nvm
    tmux
    tree
    zsh-vi-mode
)

main() {
    brew update
    for package in $PACKAGE; do
        brew install $package
    done
}

main $*
