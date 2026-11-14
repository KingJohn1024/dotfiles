#!/usr/bin/env bash
# Symlink dotfiles from this repo into $HOME.
# Safe to re-run: existing links are refreshed, real files are backed up first.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# Paths relative to both the repo and $HOME
LINKS=(
  .zshrc
  .vimrc
  .gitconfig
  .gitignore
  .tmux.conf
  .config/ghostty
  .claude/settings.json
  .claude/statusline-command.sh
  .claude/hooks/no-delete.py
)

link() {
  local src="$DOTFILES/$1" dst="$HOME/$1"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok       $dst"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "$1")"
    mv "$dst" "$BACKUP/$1"
    echo "backup   $dst -> $BACKUP/$1"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "linked   $dst -> $src"
}

for f in "${LINKS[@]}"; do
  link "$f"
done

# Ghostty on macOS also loads this file, after ~/.config/ghostty, so it would override the repo config
GHOSTTY_AS="$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
if [ -e "$GHOSTTY_AS" ]; then
  mkdir -p "$BACKUP/ghostty-app-support"
  mv "$GHOSTTY_AS" "$BACKUP/ghostty-app-support/"
  echo "backup   $GHOSTTY_AS (would override ~/.config/ghostty)"
fi

# Vim: pathogen + plugins (the .vimrc depends on both)
mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"
if [ ! -f "$HOME/.vim/autoload/pathogen.vim" ]; then
  curl -fsSLo "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim
  echo "install  pathogen"
fi
if [ -z "$(ls -A "$HOME/.vim/bundle")" ]; then
  bash "$DOTFILES/getBundles.sh"
else
  echo "ok       ~/.vim/bundle already populated (skipping getBundles.sh)"
fi

# oh-my-zsh custom plugins referenced in .zshrc
OMZ_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ -d "$HOME/.oh-my-zsh" ] && [ ! -d "$OMZ_CUSTOM/plugins/autoupdate" ]; then
  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins "$OMZ_CUSTOM/plugins/autoupdate"
  echo "install  oh-my-zsh autoupdate plugin"
fi

# Homebrew packages: reported, not installed automatically
if command -v brew >/dev/null && ! brew bundle check --file="$DOTFILES/Brewfile" >/dev/null 2>&1; then
  echo "note     Brewfile packages missing or outdated; run: brew bundle --file=$DOTFILES/Brewfile"
fi

echo "Done."
