# ~/.oh-my-zsh/themes/mycandy.zsh-theme

PROMPT='%{$fg_bold[green]%}%n@%m %{$reset_color%}%~ $(git_prompt_info)%{$fg[red]%}%(?..%?)%{$reset_color%}
%% '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}%(?.. )"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
