#!/usr/bin/env python
import os

PACKAGES=[
    'atuin',
    'bat',
    'eza',
    'git-delta',
    'go',
    'htop',
    'hyperfine',
    'jj',
    'jq',
    'neovim',
    'nvm',
    'raycast',
    'rectangle',
    'tmux',
    'tmuxp',
    'tree',
    'wezterm',
    'zsh-vi-mode',
    'zsh-autosuggestions',
    'zoxide',
]

CASKS = [
    'ghostty',
]

def main():
    for package in PACKAGES:
        os.system(f'brew install {package}')

    for cask in CASKS:
        os.system(f'brew install --cask {cask}')

if __name__ == '__main__':
    main()
