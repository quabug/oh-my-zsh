#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# Based on nicoulaj.zsh-theme 
# Prompt for the Zsh shell:
#   * One line.
#   * VCS info on the right prompt.
#   * Only shows the path on the left prompt by default.
#   * Crops the path to a defined length and only shows the path relative to
#     the current VCS repository root.
#   * Wears a different color wether the last command succeeded/failed.
#   * Shows user@hostname if connected through SSH.
#   * Shows if logged in as root or not.
# ------------------------------------------------------------------------------

# Customizable parameters.
local _max_length_=30
if [[ $TERM != 'linux' ]]; then
    local _prompt_end_="%(!.❯❯❯.❯)"
else
    local _prompt_end_="%(!.>>>.>)"
fi

local _ssh_tty_=${SSH_TTY:+"[%n@%m]"}

local -A _pc_
_pc_['success']=${1:-'green'}
_pc_['failure']=${2:-'124'}
_pc_['vcs']=${3:-'242'}
_pc_['main']=${4:-'071'}

local -A _color_
_color_['main']="%{%F{$_pc_['main']}%}"
_color_['ret']="%(?.%F{$_pc_['success']}.%F{$_pc_['failure']})"
_color_['end']="%{%f%}"
_color_['vcs']="%{%F{$_pc_['vcs']%}"

# Set required options.
setopt promptsubst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable hg bzr git svn
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*:*' stagedstr '%F{red}●'
zstyle ':vcs_info:*:*' actionformats "%S [%F{blue}%b%u%c$_color_['main']]" "%r/%s (%a)"
zstyle ':vcs_info:*:*' formats "%S [%F{blue}%b%u%c$_color_['main']]" "%r/%s"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

# Define prompts.
PROMPT="$_color_['main']$_ssh_tty_%B%$_max_length_<..<"'${vcs_info_msg_0_%%.}'"%<<$_color_['ret']$_prompt_end_%b$_color_['end'] "
RPROMPT="$_color_['vcs']"'$vcs_info_msg_1_'"$_color_['end']"
