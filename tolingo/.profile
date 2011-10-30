#!/bin/bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
# export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='andy'
# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.tolingo.com'
# Set my editor and git editor
export EDITOR="/usr/bin/mate -w"
export GIT_EDITOR='/usr/bin/mate -w'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to the path of your local jekyll root to use the jekyll aliases
# export JEKYLL_LOCAL_ROOT="~/Sites/mrminimalist"
# And change this to the remote server and root
# export JEKYLL_REMOTE_ROOT="user@server:/path/to/jekyll/root"
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

export LC_ALL=de_DE.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# bash-completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
source ~/.git_completion.sh

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

test -f .alias && source .alias


alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias h="cd $HOME"
alias sub='open -a "Sublime Text 2"'

alias be='bundle exec'
alias c="be ./script/console"
alias s="be ./script/server"
alias r="be rake"
alias testb="r spec"
alias testv="r tolingo:tests:all"
alias cdb='cd ~/Sites/bitmapi'
alias cdc='cd ~/Sites/cms'
alias cdv='cd ~/Sites/ivory'

alias tarit="tar xvfz"
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 2|xargs -n 2 git diff -R|mate'

# alias mate="open -a TextMate.app"
# alias mi="rake db:migrate"
# alias reset="rake db:migrate:reset"
# alias pull="git pull --rebase && rake gems:install && mi"