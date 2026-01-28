#!/bin/bash

# dotfiles setup script
# シンボリックリンクを作成して設定ファイルを管理する

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup/$(date +%Y%m%d_%H%M%S)"

# 色付き出力
# tesst
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# バックアップを作成してシンボリックリンクを作成
link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        # 既にシンボリックリンクの場合
        local current_target=$(readlink "$dest")
        if [ "$current_target" = "$src" ]; then
            info "Already linked: $dest -> $src"
            return 0
        else
            warn "Removing old symlink: $dest -> $current_target"
            rm "$dest"
        fi
    elif [ -e "$dest" ]; then
        # ファイル/ディレクトリが存在する場合はバックアップ
        mkdir -p "$BACKUP_DIR"
        warn "Backing up: $dest -> $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # シンボリックリンクを作成
    ln -s "$src" "$dest"
    info "Linked: $dest -> $src"
}

main() {
    echo "======================================"
    echo "  Dotfiles Setup Script"
    echo "======================================"
    echo ""
    info "Dotfiles directory: $DOTFILES_DIR"
    info "Config directory: $CONFIG_DIR"
    echo ""

    # .configディレクトリが存在しない場合は作成
    mkdir -p "$CONFIG_DIR"

    # シンボリックリンクを作成
    info "Creating symlinks..."
    echo ""

    # nvim
    link_file "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

    # karabiner
    link_file "$DOTFILES_DIR/karabiner" "$CONFIG_DIR/karabiner"

    # fish
    link_file "$DOTFILES_DIR/fish" "$CONFIG_DIR/fish"

    # ghostty
    link_file "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"

    # starship
    link_file "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

    # mise
    link_file "$DOTFILES_DIR/mise" "$CONFIG_DIR/mise"

    # git
    link_file "$DOTFILES_DIR/git" "$CONFIG_DIR/git"

    echo ""
    echo "======================================"
    info "Setup complete!"
    echo "======================================"

    if [ -d "$BACKUP_DIR" ]; then
        warn "Backup files saved to: $BACKUP_DIR"
    fi
}

main "$@"
