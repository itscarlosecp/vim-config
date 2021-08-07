# Common Profile
source $HOME/.commonrc

# Starship Prompt 
eval "$(starship init zsh)"

# Plugins
plugins+=(zsh-vi-mode)

# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"
