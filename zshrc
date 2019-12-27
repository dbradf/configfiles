# zmodload zsh/zprof

export ZSH_CUSTOM="$HOME/.zsh_custom"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dbradf"

plugins=(git git-prompt httpie kubectl npm pyenv python virtualenv vscode)

source $ZSH/oh-my-zsh.sh

set -o vi

export PATH=$HOME/.local/bin:$HOME/bin:$PATH

if [ -e "$HOME/.local_zshrc" ]; then
    source "$HOME/.local_zshrc"
fi
