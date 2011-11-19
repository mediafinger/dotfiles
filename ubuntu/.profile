#!/bin/bash

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Load RVM, if you are using it
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# Add rvm gems and nginx to the path
# export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH=$HOME/.bash_it
# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='andy'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.mediafinger.com'
# Set my editor and git editor
export EDITOR="/usr/bin/gedit -w"
export GIT_EDITOR='/usr/bin/gedit -w'

# Load Bash It
source $BASH/bash_it.sh

# Standard
export PATH=/usr/local/bin:$PATH
# MySQL
export PATH=/usr/local/mysql/bin:$PATH
# MacPorts
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# RubyGems
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
# Sphinx
#export PATH=/usr/local/Cellar/sphinx/0.9.9/bin:$PATH

export LC_ALL="en_US.UTF-8"
export LANG="en_US.utf8"

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
alias c="be rails console"
alias s="be rails server"
alias r="be rake"

alias testb="r spec"
alias testv="r tolingo:tests:all"

alias www='cd ~/www && ls -al'
alias cdp='cd ~/www/proto_socnet'
alias cdb='cd ~/www/bitmapi && rvm use 1.9.3-p0'
alias cds='cd ~/www/sellery && rvm use 1.9.3-p0'
alias cdt='cd ~/www/trans && rvm use 1.9.3-p0'
alias cdv='cd ~/www/ivory && rvm use system'


alias tarit="tar xvfz"
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 2|xargs -n 2 git diff -R|mate'

