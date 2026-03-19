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

| ディレクトリ/ファイル | 説明                     |
| --------------------- | ------------------------ |
| `nvim/`               | Neovimの設定             |
| `fish/`               | Fish shellの設定         |
| `ghostty/`            | Ghosttyターミナルの設定  |
| `karabiner/`          | Karabiner-Elementsの設定 |
| `mise/`               | miseのグローバル設定     |
| `git/`                | Gitのグローバル設定      |
| `starship.toml`       | Starshipプロンプトの設定 |
| `Brewfile`            | Homebrewパッケージ一覧   |

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
- **Cursor** - サブエディタ

### 開発ツール

- **mise** - ランタイムバージョン管理（Node.js, Python, pnpm, uv）
- **git** / **gh** - バージョン管理

## Neovimプラグイン

| プラグイン            | 説明                                 |
| --------------------- | ------------------------------------ |
| lazy.nvim             | プラグインマネージャー               |
| NvChad                | ベース設定                           |
| snacks.nvim           | ピッカー・ターミナル・ユーティリティ |
| nvim-tree.lua         | ファイラー                           |
| nvim-treesitter       | シンタックスハイライト               |
| nvim-cmp              | 自動補完                             |
| gitsigns.nvim         | Git統合（インライン表示）            |
| diffview.nvim         | Git diff可視化                       |
| flash.nvim            | 高速ナビゲーション                   |
| claudecode.nvim       | Claude AI統合                        |
| incline.nvim          | フローティングステータスライン       |
| modes.nvim            | モード別カーソルライン色変更         |
| noice.nvim            | フローティングコマンドライン・通知   |
| vimade                | 非アクティブバッファ半透明化         |
| which-key.nvim        | キーバインドヒント                   |
| overlook.nvim         | コードプレビューポップアップ         |
| hbac.nvim             | 未使用バッファ自動クローズ           |
| conform.nvim          | 保存時自動フォーマット               |
| mason.nvim            | LSP/DAP/リンター自動インストール     |
| rustaceanvim          | Rust強化（rust-analyzer統合）        |
| crates.nvim           | Cargo.toml依存管理                   |
| nvim-dap / dap-ui     | デバッグアダプタプロトコル           |
| render-markdown.nvim  | エディタ内Markdownレンダリング       |
| markdown-preview.nvim | Markdownブラウザプレビュー           |
| img-clip.nvim         | クリップボード画像ペースト           |
| nvim-scrollbar        | 診断・検索マーカー付きスクロールバー |
| autolist.nvim         | Markdownリスト自動継続               |

### Neovimキーバインド（抜粋）

| キー         | 説明                             |
| ------------ | -------------------------------- |
| `<Space>`    | リーダーキー                     |
| `<leader>e`  | NvimTreeをトグル                 |
| `<leader>ff` | ファイル検索                     |
| `<leader>fg` | テキスト検索（grep）             |
| `<leader>fb` | バッファ検索                     |
| `<leader>fh` | ヘルプ検索                       |
| `<leader>tt` | ターミナル（tmuxセッション連携） |
| `<leader>gg` | Lazygitを開く                    |
| `<leader>ac` | Claude Codeをトグル              |
| `s`          | Flashジャンプ                    |

詳細なキーマップは [nvim/README.md](nvim/README.md) を参照。

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
