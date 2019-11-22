zmodload zsh/zprof

export ZSH_CUSTOM="$HOME/.zsh_custom"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="dbradf"

plugins=(git git-prompt httpie kubectl npm pyenv python vscode)

source $ZSH/oh-my-zsh.sh

set -o vi

if [ -e "$HOME/.local_zshrc" ]; then
    source "$HOME/.local_zshrc"
fi
