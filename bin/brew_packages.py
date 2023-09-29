#!/usr/bin/env python
import os

PACKAGES=[
    'htop',
    'jq',
    'neovim',
    'nvm',
    'tmux',
    'tree',
    # 'withgraphite/tap/graphite',
    'zsh-vi-mode',
    'zsh-autosuggestions',
]

CASKS = []

def main():
    for package in PACKAGES:
        os.system(f'brew install {package}')

    for cask in CASKS:
        os.system(f'brew install --cask {cask}')

if __name__ == '__main__':
    main()
