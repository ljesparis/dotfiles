# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Disable XOFF flow control so C-s reaches tmux (prefix key)
stty -ixon

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
[ -f ~/.local/share/omarchy/default/bash/rc ] && source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
alias vim="nvim"

# Load rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# exports
export UV_HOME="$HOME/.local/bin"
export ZIG_HOME="$HOME/zig"
[ -d "$ZIG_HOME" ] && export PATH="$PATH:$ZIG_HOME"
[ -d "$UV_HOME" ]  && export PATH="$PATH:$UV_HOME"

[ -f "$UV_HOME/env" ] && . "$UV_HOME/env"

# Neovim mason-installed LSP servers / tools
[ -d "$HOME/.local/share/nvim/mason/bin" ] && export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
