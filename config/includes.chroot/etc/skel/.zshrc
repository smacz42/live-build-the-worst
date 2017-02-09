# Path to your oh-my-zsh installation.
export ZSH=/home/${USER}/.oh-my-zsh

# for andrewcz prompt
autoload -Uz add-zsh-hook
# Set name of the theme to load.
ZSH_THEME="smacz"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Do not re-echo last command before execution when using "!!"
unset HIST_VERIFY

export PATH="/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/home/$USER/.local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
source "/home/${USER}/.oh-my-zsh/oh-my-zsh.sh"
#source "/home/smacz/.local/bin/antigen.zsh"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# lemonbar export
export PANEL_FIFO="/tmp/panel-fifo"

# Set vi mode
bindkey -v

# backwards tab through options
bindkey '^[[Z' reverse-menu-complete

#export XDG_CONFIG_HOME="~/.config"
# Ansible inventory file
#export ANSIBLE_INVENTORY=~/.local/ansible/inventory.ini

# Ansible config file
#export ANSIBLE_CONFIG=~/.local/ansible/ansible.cfg

function zle-keymap-select zle-line-init {

    # change cursor shape based on vi mode
    if [[ $TERM != "linux" ]]; then
        if [ $KEYMAP = vicmd ]; then
            # vim's command mode
            if [[ $TMUX = '' ]]; then
                printf "\033[2 q" # solid block
            else
                printf "\033Ptmux;\033\033[2 q\033\\"
            fi
        else
            # insert mode
            if [[ $TMUX = '' ]]; then
                printf "\033[4 q" # solid underscore
            else
                printf "\033Ptmux;\033\033[4 q\033\\"
            fi
        fi
    fi

    zle reset-prompt
    zle -R
}

function zle-line-finish {
    if [[ $TMUX = '' ]]; then
        printf "\033[2 q" # solid block
    else
        printf "\033Ptmux;\033\033[2 q\033\\"
    fi
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
