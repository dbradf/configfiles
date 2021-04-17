PLUGINS_DIR="$HOME/etc/zshplugins"
# zmodload zsh/zprof

set -o vi

export PATH=$HOME/.cargo/bin:$HOME/tools/go/bin:$HOME/.local/bin:$HOME/bin:$PATH

local system_name=$(uname -s)
if [ "$system_name" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # export PATH="/opt/homebrew/bin:$PATH"

    for library in "openssl@1.1" "libffi" "bzip2"; do
        export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/$library/lib"
        export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/$library/include"
    done
fi

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


alias source_zshrc="source $HOME/.zshrc"
alias pr="poetry run"

mkcd() {
    local directory=$1

    if [ -z "$directory" ]; then
        echo "ERROR: Missing directory" >&2
        return 1
    fi

    mkdir $directory
    cd $directory
}


if [ -e "$PLUGINS_DIR/zsh-autosuggestions" ]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8787ff,bold,underline"
    export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

setopt inc_append_history
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
