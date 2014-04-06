PATH=/usr/local/bin:~/usr/local/bin:/usr/local/mysql/bin:$HOME/.rbenv/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
export EDITOR=vim
export DROPBOX_PUBLIC_PATH=~/Dropbox/Public

uname=`uname`
if [ $uname == "FreeBSD" ] || [ $uname == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

GREP_VERISON=`grep -V | awk 'NR==1{print $4}'`
if [ $GREP_VERISON \< "2.9" ]; then
    export GREP_COLOR=32
else
    export GREP_COLORS='ms=32:mc=01;31:sl=:cx=:fn=34:ln=31;1:bn=32:se=36'
fi

alias grep='grep --color=auto'
alias global='global -x'
alias gg='global -gx'
# alias gt='global -x'
alias ll='ls -l'

# for rails
alias tl='tail -f log/development.log'
alias tf='tail -f'
# alias tt='touch tmp/restart.txt'
alias be='bundle exec'
alias br='bundle exec rake'
alias gt='git status'
alias rsp='rails s -p'
alias rsc='rails c'
alias f='find'

D='\e[37;40m'
PINK='\e[35;40m'
GREEN='\e[32;40m'
ORANGE='\e[33;40m'
PURPLE='\e[34;40m'
YELLOW='\e[33;40m'

PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR;     fi'
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
HOSTNAME=`hostname`

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch="(${head#*/*/})"
            elif [[ $head != '' ]]; then
                git_branch="(detached)"
            else
                git_branch="(unknow)"
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}


PS1="[\[${PINK}\]\u\[${D}\]"
PS1="$PS1@"
PS1="$PS1\[${GREEN}\]$HOSTNAME\[${D}\]"
PS1="$PS1:\[${PURPLE}\]\$CurDir\[${D}\]]"
PS1="$PS1\$git_branch\\$"
export PS1

# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[38;5;167m'
export LESS_TERMCAP_md=$'\E[38;5;39m'
export LESS_TERMCAP_me=$'\E[38;5;231m'
export LESS_TERMCAP_se=$'\E[38;5;231m'
export LESS_TERMCAP_so=$'\E[38;5;167m'
export LESS_TERMCAP_ue=$'\E[38;5;231m'
export LESS_TERMCAP_us=$'\E[38;5;167m'

export LSCOLORS=exgxcxdxcxegedabagacad

# tab completion
[ -f ~/.bash_completion.d/git-completion.bash ] && . ~/.bash_completion.d/git-completion.bash
[ -f ~/.bash_completion.d/tmux-completion.sh ] && . ~/.bash_completion.d/tmux-completion.sh
[ -f `brew --prefix`/etc/bash_completion ] && . `brew --prefix`/etc/bash_completion

. `brew --prefix`/etc/profile.d/z.sh

##rbenv
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
