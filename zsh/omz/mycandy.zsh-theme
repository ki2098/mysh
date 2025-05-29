# ~/.oh-my-zsh/themes/mycandy.zsh-theme

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true

unsetopt BEEP

source ~/.git-prompt.sh

PROMPT='%{$fg_bold[green]%}%n@%m %{$reset_color%}%B%~%b $(__git_ps1 "(%s)")%{$fg[red]%}%(?.. %?)%{$reset_color%}
> '
