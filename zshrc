PLUGINS_DIR="$HOME/etc/zshplugins"
# zmodload zsh/zprof
local system_name=$(uname -s)

bindkey -v
export KEYTIMEOUT=1

autoload -U compinit; compinit

source "$HOME/.zsh/aliases"

export PATH="$HOME/.local/epithet/bin:$HOME/.cargo/bin:$HOME/tools/go/bin:$HOME/.local/bin:$HOME/bin:$PATH"

if [ -e "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  if [ "$system_name" = "Darwin" ]; then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  else
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/bash_completion
    source /usr/share/nvm/install-nvm-exec
  fi
fi

if [ "$system_name" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # export PATH="/opt/homebrew/bin:$PATH"
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

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
fi

if [ -e "$HOME/.pyenv" ]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi



if [ -e "$HOME/.gvm/scripts/gvm" ]; then
    source "$HOME/.gvm/scripts/gvm"
fi

which eza > /dev/null
if [ $? -eq 0 ]; then
    alias l="eza -lahF"
fi

which xdg-open > /dev/null
if [ $? -eq 0 ]; then
    alias open="xdg-open"
fi

which zoxide > /dev/null
if [ $? -eq 0 ]; then
    eval "$(zoxide init zsh)"
fi

which networksetup > /dev/null
if [ $? -eq 0 ]; then
    alias vpn-connect="networksetup -connectpppoeservice"
    alias vpn-disconnect="networksetup -disconnectpppoeservice"
    alias vpn-status="networksetup -showpppoestatus"
fi

if [ -e "$HOME/.zshrc_local" ]; then
    source "$HOME/.zshrc_local"
fi

mkcd() {
    local directory=$1

    if [ -z "$directory" ]; then
        echo "ERROR: Missing directory" >&2
        return 1
    fi

    mkdir -p $directory
    cd $directory
}

gccd() {
    local remote=$1
    local name=$2

    if [ -z "$name" ]; then
        name="${$(basename $remote)%.git}"
    fi

    git clone $remote $name
    cd $name
}

enableKeyRepeat() {
    if [ "$system_name" = "Darwin" ]; then
        defaults write -g ApplePressAndHoldEnabled -bool false
    fi
}

if [ "$system_name" = "Darwin" ]; then
  ZSH_VI_MODE_FILE="$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
    if [ -e "$ZSH_VI_MODE_FILE" ]; then
        source "$ZSH_VI_MODE_FILE"
    fi

    ZSH_AUTOSUGGEST_FILE="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    if [ -e "$ZSH_AUTOSUGGEST_FILE" ]; then
        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8787ff,bold,underline"
        export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        source $ZSH_AUTOSUGGEST_FILE
    fi
fi
setopt inc_append_history
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export GT_RENAME=1

which atuin > /dev/null
if [ $? -eq 0 ]; then
    eval "$(atuin init zsh)"
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
