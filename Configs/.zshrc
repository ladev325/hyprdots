export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    sudo
)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

PROMPT="  %{$fg[cyan]%}%c%{$reset_color%} "
fastfetch
export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)

# Envs
export PATH="$PATH:/home/ladev325/.local/bin"
export PATH="$PATH:$HOME/.dotnet/tools"