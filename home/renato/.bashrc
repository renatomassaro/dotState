export PS1="\[$(tput bold)\]\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]\[\033[38;5;6m\]]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
		source /usr/local/share/bash-completion/bash_completion.sh

# Update LS_COLORS
eval $(gdircolors -b $HOME/.dircolors)

# enable color support of ls and also add handy aliases
if [ -x /usr/local/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
    #alias ls='ls -G'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias ls='ls -G'

# Sane clipboard-related functions
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# Start ssh-agent once, load env vars on every shell 
ssh-add -l &>/dev/null
if [ "$?" == 2 ]; then
    test -r ~/.agent-ssh && eval "$(<~/.agent-ssh)" >/dev/null

    ssh-add -l &>/dev/null
    if [ "$?" == 2 ]; then
        (umask 066; ssh-agent > ~/.agent-ssh)
    	eval "$(<~/.agent-ssh)" >/dev/null
    fi
fi

export GPGKEY=E0B3CC5A

# Temporary, until ansible 2.3 comes out....
#source ~/ansible/hacking/env-setup -q
