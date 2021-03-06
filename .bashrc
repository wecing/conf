alias vi='vim'
# alias vim='/usr/local/Cellar/vim/7.4.488/bin/vim'
alias ls='ls -BG'
alias ggrep='git grep -En'
alias mvim='open -a MacVim'
alias c4='java -jar ~/Code/c4/target/scala-2.11/c4-assembly-1.0.jar'

alias llvm='clang -pedantic -Wno-comment -S -O0 -emit-llvm -std=c89'

# enable git branch info in PS1 and git completion
if [ -e '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash' ]; then
    source '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash'
    source '/Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh'
elif [ -e '/usr/local/etc/bash_completion.d/git-prompt.sh' ]; then
    source '/usr/local/etc/bash_completion.d/git-completion.bash'
    source '/usr/local/etc/bash_completion.d/git-prompt.sh'
fi

export EDITOR='vim'
export PS1='\[\033[1;32m\]--------------------\n\[\033[0;33m\]\W\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]") \[\e[0;96m\]\$\[\033[0m\] '
