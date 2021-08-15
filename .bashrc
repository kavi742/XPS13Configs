# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -p'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#(cat ~/.cache/wal/sequences &)
  export SPICETIFY_INSTALL="/home/kavi741/spicetify-cli"
  export INTELLIJ_PATH="/home/kavi741/idea-IC-211.6693.111/bin"
  export PATH="$SPICETIFY_INSTALL:$INTELLIJ_PATH:$PATH"

#undervolt
#alias undervolt="sudo python3 ~/undervolt/undervolt.py"

#alias shut="shutdown now"
alias shutdown="systemctl poweroff"
alias restart="systemctl reboot"
alias weather="curl wttr.in/Brampton"
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias update="sudo apt-get update -y;sudo apt-get upgrade -y;sudo apt autoremove -y;"
alias airplay="java -jar ~/airplay.jar"
wolf(){
		firefox ~/.tmp/WolfreeAlpha.github.io/index.html &
		exit
}
alias youtube="ytfzf"
alias vpn="sudo tailscale"
sshPlex(){
		ssh plex@$(tailscale status|grep plex|grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
}
alias sensors="sensors | grep -E 'id|Core'"
alias emacs='emacs -nw'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#looks
USER="kavi741 " HOSTNAME=" Dell XPS 13 9300" EDITOR="vim" PF_ASCII="tux" PF_INFO="ascii title os  kernel uptime memory wm editor" pfetch
# curl wttr.in/Brampton?format="%l:+%c+%C+%f+%w+%m\n"
/home/kavi741/Color-Scripts/color-scripts/panes

export TERM=xterm-256color
EDITOR=vim
SUDO_EDITOR=vim

#prompt
source ~/.bash-powerline.sh

source "$HOME/.cargo/env"
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'
eval "$(thefuck --alias)"

