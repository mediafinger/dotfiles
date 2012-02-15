#!/bin/bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='andy'
# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.tolingo.com'
# Set my editor and git editor
# export EDITOR="/usr/bin/mate -w"
# export GIT_EDITOR='/usr/bin/mate -w'
# sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
export EDITOR='subl -w'
export GIT_EDITOR='subl -w'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH/bash_it.sh

# Standard
export PATH=/usr/local/bin:$PATH
# MySQL
export PATH=/usr/local/mysql/bin:$PATH
# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# RubyGems
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
# Sphinx
export PATH=/usr/local/Cellar/sphinx/0.9.9/bin:$PATH

#export LC_ALL=de_DE.UTF-8
export LC_ALL=en_US.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
# source ~/.git_completion.sh

# Fancy git prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[development environment^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# expand .bash_history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# activate color for ls
export CLICOLOR=true
export LSCOLORS=true
LSCOLORS=ExgxfxgfBxegedbeacbhag

source $HOME/.ssh/auth_keys

# make Rails faster, but increase its memory footprint:
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000


test -f .alias && source .alias

alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias h="cd $HOME"

alias be='bundle exec'
alias c="be ./script/console"
alias s="be ./script/server"
alias s1="be rails server --port=3001"
alias c1="be rails console"
alias r="be rake"
alias testb="r spec"
alias testv="r tolingo:tests:all"
alias cdb='cd ~/Sites/bitmapi && rvm use system'
alias cdc='cd ~/Sites/cms && rvm use 1.9.3-p0'
alias cde='cd ~/Sites/edge && rvm use 1.9.3-p0'
alias cds='cd ~/Sites/sellery && rvm use 1.9.3-p0-perf'
alias cdt='cd ~/Sites/trans && rvm use 1.9.3-p0'
alias cdv='cd ~/Sites/ivory && rvm use system'

alias sub='subl'
alias tarit="tar xvfz"
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 2|xargs -n 2 git diff -R|mate'
