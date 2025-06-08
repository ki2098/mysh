alias ls='ls -hF --color=tty'

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export MSYS=winsymlinks:nativestrict

PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]`__git_ps1` \[\033[31m\]${?##0}\[\033[00m\]\n> '
