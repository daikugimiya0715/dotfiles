# dotfiles

個人用のdotfilesリポジトリです。

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/your-username/dotfiles.git ~/projects/personal/dotfiles

# Homebrewでパッケージをインストール
brew bundle --file=~/projects/personal/dotfiles/Brewfile

# シンボリックリンクを作成
./setup.sh
```

## 管理対象

| ディレクトリ/ファイル | 説明 |
|---------------------|------|
| `nvim/` | Neovimの設定 |
| `fish/` | Fish shellの設定 |
| `ghostty/` | Ghosttyターミナルの設定 |
| `karabiner/` | Karabiner-Elementsの設定 |
| `mise/` | miseのグローバル設定 |
| `git/` | Gitのグローバル設定 |
| `starship.toml` | Starshipプロンプトの設定 |
| `Brewfile` | Homebrewパッケージ一覧 |

## 主要ツール

### シェル環境
- **fish** - メインシェル
- **starship** - プロンプト（Catppuccin Mochaテーマ）

### ターミナル
- **Ghostty** - メインターミナル（Draculaテーマ、JetBrainsMono Nerd Font）
- **iTerm2** - サブターミナル

### エディタ
- **Neovim** - メインエディタ
- **Visual Studio Code** - サブエディタ

### 開発ツール
- **mise** - ランタイムバージョン管理（Node.js, Python, pnpm, uv）
- **git** / **gh** - バージョン管理

## Neovimプラグイン

| プラグイン | 説明 |
|-----------|------|
| lazy.nvim | プラグインマネージャー |
| tokyonight.nvim | カラースキーム |
| nvim-tree.lua | ファイラー |
| telescope.nvim | ファジーファインダー |
| nvim-treesitter | シンタックスハイライト |
| nvim-cmp | 自動補完 |
| lualine.nvim | ステータスライン |
| gitsigns.nvim | Git統合 |
| toggleterm.nvim | ターミナル統合 |
| im-select.nvim | 日本語入力自動切替 |

### Neovimキーバインド

| キー | 説明 |
|------|------|
| `<Space>` | リーダーキー |
| `<C-n>` | NvimTreeをトグル |
| `<C-m>` | NvimTreeにフォーカス |
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | テキスト検索（grep） |
| `<leader>fb` | バッファ検索 |
| `<leader>fh` | ヘルプ検索 |
| `<C-\>` | フローティングターミナル |

## miseで管理しているランタイム

- Node.js 22
- pnpm 8.15.5
- Python 3.12.6
- uv (latest)

## Karabiner-Elements

キーリマップの設定を管理。

## 依存関係

このdotfilesは以下のツールがBrewfileでインストールされることを前提としています：

- `fish` - config.fishの動作に必要
- `mise` - ランタイム管理
- `starship` - プロンプト表示
- `neovim` - エディタ
- `im-select` - Neovimの日本語入力切替
- `font-jetbrains-mono-nerd-font` - Ghosttyのフォント
