# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#############################################
#		MacOs-Specific
#############################################

export GPG_TTY=$(tty)
# brew bin
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/go/bin:$PATH
# python bin
export PATH=$HOME/Library/Python/3.9/bin:$PATH
# Rust Log
export RUST_LOG=debug
# /usr/local/bin
export PATH=/usr/local/bin:$PATH

##############################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fino" # set by `omz`

zstyle ':omz:update' mode reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"


#############################################
#		Plugins
#############################################

plugins=(git fzf vi-mode python)

#############################################

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias e="emacsclient -nc"
alias ls="eza -la"
alias gs="git status"
alias cr="cargo run"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.cargo/env"
