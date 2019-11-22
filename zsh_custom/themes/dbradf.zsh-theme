

RCODE="%(?..%K{red}%B(%?%)%k%b )"
CLOCK="%F{cyan}[%t]"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}(git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%)%f%b"

PROMPT='$RCODE%F{magenta}[py>$(pyenv_prompt_info)]$f %F{green}%n%f@%F{cyan}%m%f:%F{green}%2~%f $(git_prompt_info) $(git_prompt_status)
%# '
RPROMPT="$CLOCK"

