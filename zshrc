# zmodload zsh/zprof

which starship > /dev/null
if [ $? -eq 0 ]; then
    eval "$(starship init zsh)"
else
    export ZSH_CUSTOM="$HOME/.zsh_custom"
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="dbradf"

    plugins=(git git-prompt httpie kubectl npm pyenv python virtualenv vscode)
    source $ZSH/oh-my-zsh.sh
fi

set -o vi

alias source_zshrc="source $HOME/.zshrc"

export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH

which exa > /dev/null
if [ $? -eq 0 ]; then
    alias l="exa -lahF"
fi

which xdg-open > /dev/null
if [ $? -eq 0 ]; then
    alias open="xdg-open"
fi

if [ -e "$HOME/.local_zshrc" ]; then
    source "$HOME/.local_zshrc"
fi


