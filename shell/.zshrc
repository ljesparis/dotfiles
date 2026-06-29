# Disable XOFF flow control so C-s reaches tmux (prefix key)
stty -ixon

# UV / local bin env
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Neovim mason-installed LSP servers / tools
[ -d "$HOME/.local/share/nvim/mason/bin" ] && export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
