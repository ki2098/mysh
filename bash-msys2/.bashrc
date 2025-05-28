PS1='\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]'
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'`__git_ps1`'   # bash function
	fi
fi
PS1=$PS1' \[\e[31m\]${?#0}'
PS1=$PS1'\[\e[0m\]\n% '
