# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a *package* whose contents mirror `$HOME`.

## Layout

```
dotfiles/
├── tmux/                         # package
│   ├── .tmux.conf                → ~/.tmux.conf
│   └── .config/tmux/tmux.conf    → ~/.config/tmux/tmux.conf
├── shell/
│   ├── .bashrc                   → ~/.bashrc
│   └── .zshrc                    → ~/.zshrc
└── nvim/
    └── .config/nvim/             → ~/.config/nvim/
```

## Apply on a new machine

```bash
# deps
sudo pacman -S stow      # Arch
brew install stow        # macOS

git clone git@github.com:ljesparis/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow tmux shell nvim     # symlink specific packages
# stow */                # or every package at once
```

If a target file already exists, stow refuses — move/delete it first, then
re-run `stow <pkg>`.

## Remove a package

```bash
cd ~/dotfiles && stow -D tmux
```

## Add a new package

```bash
mkdir -p ~/dotfiles/<pkg>/<path-under-home>
mv ~/<path-under-home>/file ~/dotfiles/<pkg>/<path-under-home>/file
cd ~/dotfiles && stow <pkg>
```

## Notes

- **tmux**: `~/.config/tmux/tmux.conf` (Omarchy base) sources `~/.tmux.conf`
  (personal overrides) at its end. Both tracked. TPM plugins
  (`~/.tmux/plugins/tpm`) are not vendored — clone separately, then
  `prefix + I` to install.
- **shell**: `.bashrc` (Linux/bash) and `.zshrc` (macOS/zsh). External tool
  loads (rust, uv, zig, mason, omarchy) are existence-guarded, so a machine
  missing them won't error on shell start. macOS needs `stty -ixon` for the
  tmux `C-s` prefix — already in `.zshrc`.
- **nvim**: config vendored (previously a standalone repo). `lazy-lock.json`
  pins plugin versions; lazy.nvim installs on first launch. Plugin installs
  live in `~/.local/share/nvim` — not tracked.
- **macOS extras**: Ghostty needs `macos-option-as-alt = true` in
  `~/.config/ghostty/config` for the `M-h/j/k/l` tmux pane navigation.
