# Preferred editor
export EDITOR='nvim'

# Bei Ranger nur custom conf laden
#RANGER_LOAD_DEFAULT_RC=FALSE

# aliases
alias ls="ls --color=auto"
alias ll="ls -la"
alias l.="ls -d .* --color=auto"
alias zshrc="vim ~/.zshrc"
alias grep="grep --color=auto"
alias conf="cd ~/.config"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"
alias sxhkdrc="vim ~/.config/sxhkd/sxhkdrc"
alias polyconf="vim ~/.config/polybar/config"
alias polyscripts="cd ~/.config/polybar/scripts"
alias vimrc="vim ~/.config/nvim/init.vim"
alias vim="/usr/bin/nvim"

# # Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sepp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# mit POS1 Key zu Line Anfang springen
#bindkey '^[[1~' beginning-of-line
## mit ENDE Key zu Line Ende springen
#bindkey '^[[4~' end-of-line

#autoload -U copy-earlier-word
#zle -N copy-earlier-word
#bindkey '^[,' copy-earlier-word
#
## Allow Ctrl-v to edit the command line
#autoload -Uz edit-command-line
#bindkey -M vicmd '^V' edit-command-line

# colorscheme mit pywal
#(cat ~/.cache/wal/sequences &)

# wrap hub with git
# eval "$(hub alias -s)"

# PLUGINS
# syntax-highlighting
source "$HOME/Software/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# zsh-nvm
#export NVM_LAZY_LOAD=true
export NVM_NO_USE=true
source ~/Software/zsh-nvm/zsh-nvm.plugin.zsh
# vim mode
VIM_MODE_VICMD_KEY="jk"
MODE_CURSOR_VIINS="#ebdbb2 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="#a9b665 block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
source "$HOME/Software/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#
# ZLE CUSTOM
#

# VI Keymode
bindkey -v
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "^[." insert-last-word

# TMUX FIX home and end
if [[ -n "$TMUX" ]]; then
	bindkey "\e[1~"  beginning-of-line
	bindkey "\e[4~"  end-of-line
fi

# del key in st
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

# theme setzen
SPACESHIP_VI_MODE_SHOW=false

autoload -U promptinit; promptinit
prompt spaceship

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
