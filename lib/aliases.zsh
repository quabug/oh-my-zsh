# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias la='ls -a'
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -lh'
#alias sl=ls # often screw this up

alias afind='ack-grep -il'


#alias ssh="TERM=xterm ssh"
alias w3m="TERM=xterm w3m"
alias trn="TERM=xterm trn -x -X"
#alias irssi="irssi --hostname=quabug.net"
alias sshproxy="ssh -D 8080 -qTnCN2"
#alias wine='LC_ALL=zh_CN.UTF-8 /usr/bin/wine'
#alias foobar2000='wine /win/d/Program\ Files/foobar2000/foobar2000.exe'

alias fbreload="kill -s usr2 `pgrep fluxbox`"

alias eclipse="/share/software/eclipse/eclipse"

#alias emule='wine /win/d/Program\ Files/Xtreme/eMule.exe'

## to trick zsh vcs_info on $HOME directory.
alias config="GIT_DIR=$HOME/.config.git/ git --work-tree=$HOME"
