#gehört nach <git home>\etc\profile.d\gid-prompt.sh
BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

PS1='\[\033]0;${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
PS1="$PS1"'\u '             # user@host<space>
#PS1="$PS1"'\u@\h '             # user@host<space>
#PS1="$PS1"'\[\033[35m\]'       # change to purple
#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
#PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1$BLUE"                 # change to brownish yellow
PS1="$PS1"'\W'                  # current working directory

# PS2: shown while waiting for input (interactive)
export PS2="$GREEN\w$BLACK "
# PS1: standard shell prompt
export GIT_PS1_SHOWUPSTREAM="auto verbose"
export GIT_PS1_SHOWDIRTYSTATE="yes"
export GIT_PS1_SHOWSTASHSTATE="yes"
export GIT_PS1_SHOWUNTRACKEDFILES="yes"
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
										#		PS1="$PS1"'\[\033[36m\]'  # change color to cyan
		PS1="$PS1"'\[\e[1;32m\]'  # change color to green
		PS1="$PS1"'`__git_ps1`'   # bash function
	fi
fi

PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $
														
