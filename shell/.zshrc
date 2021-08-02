# Common Profile
source $HOME/.commonrc

export ZSH="$HOME/.oh-my-zsh"

# Starship Prompt 
eval "$(starship init zsh)"

# ZSH Plugins (using oh-my-zsh)
plugins=(
	zsh-autosuggestions
)
