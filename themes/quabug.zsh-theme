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
local _prompt_default_end_=❯
local _prompt_root_end_=❯❯❯
if [[ $TERM == 'linux' ]]; then
    _prompt_default_end_='>'
    _prompt_root_end_='>>>'
fi

# Set required options.
#setopt promptsubst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable hg bzr git svn
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr "%{$fg[yellow]%}●"
zstyle ':vcs_info:*:*' stagedstr "%{$fg[red]%}●"
zstyle ':vcs_info:*:*' actionformats "%S [%{$fg[blue]%}%b%u%c%{$FG[071]%}]%{$reset_color%}" "%r/%s (%a)"
zstyle ':vcs_info:*:*' formats "%S [%{$fg[blue]%}%b%u%c%{$FG[071]%}]%{$reset_color%}" "%r/%s"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

# Define prompts.
PROMPT="%{$FG[071]%}${SSH_TTY:+[%n@%m]}%{$FX[bold]%}%$_max_length_<..<"'${vcs_info_msg_0_%%.}'"%{$FG[071]%}%(!.$_prompt_root_end_.$_prompt_default_end_)%{$FX[no-bold]%}%{$reset_color%} "
RPROMPT=" %{$FG[242]%}"'$vcs_info_msg_1_'"%{$reset_color%}"
