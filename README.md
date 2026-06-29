# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a *package* whose contents mirror `$HOME`.

## Layout

```
dotfiles/
└── tmux/                         # package
    ├── .tmux.conf                → ~/.tmux.conf
    └── .config/tmux/tmux.conf    → ~/.config/tmux/tmux.conf
```

## Apply on a new machine

```bash
# deps
sudo pacman -S stow      # Arch
brew install stow        # macOS

git clone <repo-url> ~/dotfiles
cd ~/dotfiles
stow tmux                # symlink one package
# stow */                # or all packages
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

- tmux: `~/.config/tmux/tmux.conf` (Omarchy base) sources `~/.tmux.conf`
  (personal overrides) at its end. Both tracked.
- Plugins (TPM `~/.tmux/plugins/tpm`) are not vendored — clone separately.
