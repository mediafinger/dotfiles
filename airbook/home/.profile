#!/bin/bash

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='andy'
# Load Bash It
source $BASH/bash_it.sh

# expand .bash_history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
# source ~/.git_completion.sh


# Path
export PATH=/usr/local/bin:$PATH
# RubyGems
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
# Sphinx
export PATH=/usr/local/Cellar/sphinx/0.9.9/bin:$PATH

export LC_ALL=de_DE.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad

# activate color for ls
export CLICOLOR=true
export LSCOLORS=true
LSCOLORS=ExgxfxgfBxegedbeacbhag


# Load rbfu
eval "$(rbfu --init --auto)"

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.tolingo.com'

# Set my editor
export EDITOR="/usr/local/bin/subl -w"
# Set git editor
export GIT_EDITOR='/usr/local/bin/subl -w'
# SymLink Sublime to subl needed first:
#ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Fancy git prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[development environment^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

test -f .alias && source .alias

alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias h="cd $HOME"

alias be='bundle exec'
alias c="be ./script/console"
alias s="be ./script/server"
alias r="be rake"
alias cdb='cd ~/tolingo/bitmapi'
alias cdc='cd ~/tolingo/cms'
alias cds='cd ~/tolingo/sellery'
alias cdt='cd ~/tolingo/trans'
alias cdv='cd ~/tolingo/ivory'

alias www='cd ~/www'
alias sub='open -a "Sublime Text 2"'
alias mate='sub'

alias tarit="tar xvfz"
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 2|xargs -n 2 git diff -R|mate'


# Set the path nginx
export NGINX_PATH='/opt/nginx'
# Don't check mail when opening terminal.
unset MAILCHECK
