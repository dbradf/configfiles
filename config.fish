
fish_vi_key_bindings

which starship 2>&1 > /dev/null
if test $status -eq 0
    starship init fish | source
end

which xdg-open 2>&1 > /dev/null
if test $status -eq 0
    function open
        command xdg-open $argv
    end
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

function pr
    command poetry run $argv
end


