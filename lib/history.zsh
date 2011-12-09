## Command history configuration
HISTFILE=$HOME/.history
HISTSIZE=10000
SAVEHIST=10000

#setopt hist_ignore_dups # ignore duplication command history list
#setopt share_history # share command history data
#
#setopt hist_verify
#setopt inc_append_history
##setopt extended_history
#setopt hist_expire_dups_first
#setopt hist_ignore_space
#
##setopt SHARE_HISTORY
#setopt APPEND_HISTORY

setopt SHARE_HISTORY # share command history data
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS # ignore duplication command history list
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
#
