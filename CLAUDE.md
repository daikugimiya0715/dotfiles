# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS用の個人dotfilesリポジトリ。各設定ファイルは `setup.sh` により `~/.config/` 以下へシンボリックリンクされる（tmuxのみ `~/.tmux.conf`）。

## セットアップ

```bash
brew bundle --file=Brewfile   # パッケージインストール
./setup.sh                    # シンボリックリンク作成
```

## アーキテクチャ

### Neovim (`nvim/`)
- **ベース**: NvChad v2.5 + lazy.nvim
- **エントリポイント**: `init.lua` → lazy.nvimでNvChadとプラグインをロード
- **プラグイン定義**: `lua/plugins/` 以下に機能別で分割（`lsp.lua`, `ai.lua`, `completion.lua`, `git.lua`, `navigation.lua`, `ui.lua`, `lang.lua`, `diagnostics.lua`, `init.lua`）
- **プラグイン設定**: `lua/configs/` 以下（`lspconfig.lua`, `conform.lua`, `lazy.lua`）
- **マッピング**: `lua/mappings.lua`、リーダーキーはスペース
- **オプション**: `lua/options.lua`（透明背景、cmdheight=0、相対行番号）
- **テーマ設定**: `lua/chadrc.lua`（NvChad固有の設定）

### Fish Shell (`fish/`)
- `config.fish` に全設定を集約（XDG、PATH、エイリアス、abbreviation、キーバインド、ツール統合）
- マシン固有設定は `~/.config/fish/local.fish`（gitignored）に記述

### その他の設定ファイル
- `starship.toml` — Starshipプロンプト（Catppuccin Mochaパレット）
- `ghostty/config` — Ghosttyターミナル
- `karabiner/` — Karabiner-Elements（キーリマップ）
- `mise/config.toml` — ランタイムバージョン管理
- `git/ignore` — グローバルgitignore
- `tmux/.tmux.conf` — tmux設定
- `Brewfile` — Homebrewパッケージ一覧

## 注意事項

- Neovimプラグインの追加・変更時は `lua/plugins/` の適切なカテゴリファイルに配置する
- フォーマッタ・リンターの設定は `lua/configs/conform.lua` で管理
- LSPサーバーの設定は `lua/configs/lspconfig.lua`、インストール対象は `lua/plugins/lsp.lua` のmason設定で管理
- インデントはスペース2つ（Neovim設定準拠）
