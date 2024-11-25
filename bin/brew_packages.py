#!/usr/bin/env python
import os

PACKAGES=[
    'atuin',
    'bat',
    'eza',
    'htop',
    'hyperfine',
    'jq',
    'marta',
    'neovim',
    'nvm',
    'tmux',
    'tmuxp',
    'tree',
    'zsh-vi-mode',
    'zsh-autosuggestions',
    'zoxide',
]

CASKS = []

def main():
    for package in PACKAGES:
        os.system(f'brew install {package}')

    for cask in CASKS:
        os.system(f'brew install --cask {cask}')

if __name__ == '__main__':
    main()
