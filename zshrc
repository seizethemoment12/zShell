#Variables
export EDITOR='vim'
export BROWSER='chrome'
export THEME=adam2

#Set up the prompt
autoload -U colors && colors
setopt prompt_subst
autoload -Uz promptinit
promptinit
prompt $THEME

# My Prompt (work in progress)
#PROMPT="%{$fg[yellow]%}%1~ %{$reset_color%}%#"
#RPROMPT="{[$fg[cyan]%}%n@%{$fg[cyan]%}%m %{$fg[red]%}%T%{$reset_color%}]"
#P2="%{$fg[yellow]%}%1~ %{reset_color%}%#"

#Options
setopt histignorealldups sharehistory
setopt completealiases
setopt auto_cd

# Programs to run
autoload zcalc

# Keybindings
bindkey -e
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'

# Group items in the completion list
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

# Add color to completion list
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''


zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Complete process ID's with the menu selection
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'i


###############################################################################
#My Alias

#AutoExtentions
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s c=$EDITOR
alias -s cpp=$EDITOR
alias -s sh=$EDITOR
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'

#Normal aliases
alias ls='ls --color=auto -F'
alias j=jobs -l
alias vi=vim
#alias push='git push origin master'
