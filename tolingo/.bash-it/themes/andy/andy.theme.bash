#!/bin/bash

SCM_THEME_PROMPT_PREFIX="${red}|"
SCM_THEME_PROMPT_DIRTY=" ${black}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_PREFIX="${green}("
GIT_THEME_PROMPT_DIRTY=" ${black}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_SUFFIX="${green})"

RVM_THEME_PROMPT_PREFIX="${white}|"
RVM_THEME_PROMPT_SUFFIX=""


function prompt_command() {
  PS1="${bold_blue}\w $(rvm_version_prompt) $(git_prompt_info) ${bold_blue}>${black} ${reset_color}"
}

PROMPT_COMMAND=prompt_command;
