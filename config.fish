
fish_vi_key_bindings

function add_path_if_exists
    for dir in $argv
        if test -d "$dir"
            set PATH "$dir:$PATH"
        end
    end
end

add_path_if_exists "$HOME/.local/bin" "$HOME/bin"

# Rust setup
add_path_if_exists "$HOME/.cargo/bin"

which starship 2>&1 > /dev/null
if test $status -eq 0
    starship init fish | source
end


which zoxide 2>&1 > /dev/null
if test $status -eq 0
    zoxide init fish | source
end

which exa 2>&1 > /dev/null
if test $status -eq 0
    function l
        command exa -lahF $argv
    end
end


# Python Setup

if test -d "$HOME/.pyenv"
    add_path_if_exists "$HOME/.pyenv/bin"
    pyenv init - | source
    pyenv virtualenv-init - | source
end

function pr
    command poetry run $argv
end


# Misc

which xdg-open 2>&1 > /dev/null
if test $status -eq 0
    function open
        command xdg-open $argv
    end
end

function mkcd
    mkdir -p $argv
    cd $argv
end