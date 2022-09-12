############################################
# nick's thinkpad x1 yoga zshell config #
############################################

################
# command-line #
################

# command-line environment variables
export TERM=xterm-256color
#export TERM=vt102

export PE="emacs"
export VISUAL="$PE"
export EDITOR="$VISUAL"

export GPG_TTY=$(tty)

# command aliases
alias vim="echo 'no vim for you.'"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# application specific environment variables 
export CSE220_UBIT="njbrown4"

export LIBVIRT_DEFAULT_URI="qemu+ssh://nick@threadpuller/system"

export DOCKER_HOST="ssh://nick@threadpuller"

export PICO_SDK_PATH="/home/nick/repos/pico-sdk/"

export CEDEV=~/CEdev
export PATH=$CEDEV/bin:$PATH

############
## wayland #
############
export WLR_DRM_NO_MODIFIERS=1
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP="Unity"
export XDG_SESSION_TYPE="wayland"
export MOZ_ENABLE_WAYLAND=1
export BEMENU_BACKEND="wayland"
export KITTY_ENABLE_WAYLAND=1

##################################
# zshell specific customizations #
##################################

# Enable colors
autoload -U colors && colors

# change prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#
# this resource is for bash, but it seems to also work for zshell. YMMV
# https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-bash-ps1-prompt/124409#124409
#
PROMPT='%F{147}%n%F{243}@%F{228}%M %F{219}%~ %F{158}${vcs_info_msg_0_} 
%F{243}$ %F{white}'
RPROMPT='%F{168}%(?..[%?] )'
zstyle ':vcs_info:git:*' formats '%b'

# shell history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# use vi keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # use beam shape cursor for each new prompt.

##################
# zshell plugins #
##################

# fzf-completion
source /home/nick/.config/nvim/plugged/fzf/shell/completion.zsh
# these variables have to be set AFTER `fzf` is loaded
export FZF_DEFAULT_COMMAND="find ."
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

##################
# window manager #
##################

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 7 ]; then
    exec sway
fi
