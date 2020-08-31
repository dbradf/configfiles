# zmodload zsh/zprof

export PATH=$HOME/.cargo/bin:$HOME/tools/go/bin:$HOME/.local/bin:$HOME/bin:$PATH

export GOROOT=$HOME/tools/go
export GOPATH=$HOME/gobase

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

if [ -e "$HOME/.pyenv" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -e "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

if [ -e "$HOME/.gvm/scripts/gvm" ]; then
    source "$HOME/.gvm/scripts/gvm"
fi

which exa > /dev/null
if [ $? -eq 0 ]; then
    alias l="exa -lahF"
fi

which xdg-open > /dev/null
if [ $? -eq 0 ]; then
    alias open="xdg-open"
fi

which zoxide > /dev/null
if [ $? -eq 0 ]; then
    eval "$(zoxide init zsh)"
fi

if [ -e "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi


