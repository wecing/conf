# [[ -s ${HOME}/Code/conf/.local.bash ]] && source ${HOME}/Code/conf/.local.bash

alias vi='vim'
alias ls='ls -BG'

# for hoogle, both in cmdline and ghci
export PATH="$HOME/Library/Haskell/bin:$PATH"

export EDITOR='vim'

# enable git branch info in PS1 and git completion
if [ -e '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash' ]; then
    source '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash'
    source '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh'
fi

export PS1='\[\033[0;33m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]") \[\e[0;96m\]\$\[\033[0m\] '
