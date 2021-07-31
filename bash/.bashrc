### GLOBALS ###
# Applications
export EDITOR="nvim"
export VISUAL="$EDITOR"
# export TERM="kitty"

# Behaviour
export HISTCONTROL="ignoreboth"

# PATH exports

# Vi Mode
# set -o vi

### ALIASES ###
# Battery
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|to\ full|percentage"

# fc uses Vim instead of Neovim
alias fc="fc -e vi"

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# LS 
if lsd_loc="$(type -p "lsd")" || [[ -z "lsd_loc" ]]; then 
	alias ls="lsd"
else
	alias ls="ls --color=auto --group-directories-first"
fi

# Quick access
alias .files="cd $HOME/.dotfiles"
alias dev="cd $HOME/Documents/dev"
alias uba="cd $HOME/Documents/UBA"

# APPLICATIONS 
# Neovim
alias nvim-perf="nvim --startuptime startup.log -c exit && tail -100 startup.log"

# Node Version Manager (NVM) 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Starship Prompt 
if starship_loc="$(type -p "starship")" || [[ -z "starship_loc" ]]; then 
	eval "$(starship init bash)"
else
	echo "Starship not installed"
fi

# Neofetch
# if neofetch_loc="$(type -p "neofetch")" || [[ -z "neofetch_loc" ]]; then 
	# neofetch
# else
	# echo "Neofetch not installed"
# fi
