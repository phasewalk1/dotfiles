for file in ~/.config/fish/functions/**/*.fish
    source $file
end

### Bins
# .local bin
set -g PATH $HOME/.local/bin $PATH
# Cargo bin
set -g PATH $HOME/.cargo/bin $PATH
# Go bin
set -x PATH $PATH (go env GOPATH)/bin
# Nyoom bin
set -x PATH $PATH $HOME/.config/nvim/bin
# Luarocks bin
set -x PATH $PATH $HOME/.luarocks/bin
# Emacs bin
set -x PATH $PATH $HOME/.config/emacs/bin

### Globals
set -g HOSTNAME (hostname)
# Fix GPG to the tty for siging commits
set -gx GPG_TTY (tty)
# Set the default editor
set -g EDITOR nvim

set -gx RUST_LOG debug

### Misc
set WALLS $HOME/Documents/Pictures/Walls

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
