# dotfiles

個人用のdotfilesリポジトリです。NvChad v2.5ベースのNeovim設定と、Fish shellを中心としたモダンな開発環境を構築しています。

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
| `nvim/`               | Neovimの設定（NvChad v2.5ベース） |
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
- **starship** - プロンプト
- **atuin** - 高度なシェル履歴管理
- **zoxide** - スマートcd（zコマンド）
- **direnv** - ディレクトリ環境変数

### ターミナル

- **Ghostty** - メインターミナル（Draculaテーマ、JetBrainsMono Nerd Font、背景透過70%）
- **iTerm2** - サブターミナル

### エディタ

- **Neovim** - メインエディタ（NvChad v2.5ベース）
- **Visual Studio Code** - サブエディタ

### 開発ツール

- **mise** - ランタイムバージョン管理
- **git** / **gh** - バージョン管理
- **lazygit** - Git TUI
- **delta** - Git差分表示

### CLIツール強化

- **eza** - `ls`の代替（アイコン・Git情報付き）
- **bat** - `cat`の代替（シンタックスハイライト付き）
- **ripgrep** - `grep`の代替（高速検索）
- **fd** - `find`の代替（高速ファイル検索）
- **fzf** - ファジーファインダー

---

## Neovim設定

NvChad v2.5をベースにした、最小UIで最大の編集領域を確保するモダンな設定です。

### プラグイン一覧

#### UI/ビジュアル

| プラグイン | 説明 |
|-----------|------|
| incline.nvim | ファイル情報を浮動ステータスラインで表示 |
| modes.nvim | カーソルラインの色でエディタモードを可視化 |
| noice.nvim | コマンドラインとメッセージをポップアップで表示 |
| nvim-notify | 改善された通知UI |
| vimade | 非アクティブバッファを薄暗くする |
| better-escape.nvim | jk/jjでEscape |
| which-key.nvim | キーマップヒント表示 |
| indent-blankline.nvim | インデントガイド表示 |

#### ナビゲーション

| プラグイン | 説明 |
|-----------|------|
| snacks.nvim | モダンユーティリティ（picker, lazygit, terminal） |
| telescope.nvim | ファジーファインダー |
| oil.nvim | ファイルマネージャー |
| flash.nvim | 高速ナビゲーション（s/Sキー） |
| hbac.nvim | 未使用バッファ自動クローズ |
| overlook.nvim | 定義のピーク表示 |

#### Git統合

| プラグイン | 説明 |
|-----------|------|
| gitsigns.nvim | インラインGit情報表示 |
| diffview.nvim | Git diff可視化・マージツール |

#### LSP/フォーマット/構文解析

| プラグイン | 説明 |
|-----------|------|
| nvim-lspconfig | LSP設定管理 |
| mason.nvim | LSP/DAP/Linter自動インストール |
| conform.nvim | コード整形（複数フォーマッター対応） |
| nvim-treesitter | 構文ハイライト・インデント |
| nvim-cmp | オートコンプリート |

#### AI/言語サポート

| プラグイン | 説明 |
|-----------|------|
| claudecode.nvim | Claude AI統合 |
| rustaceanvim | Rust拡張サポート |
| crates.nvim | Cargo.toml依存関係管理 |
| render-markdown.nvim | Markdownレンダリング |

### Neovimキーマップ

#### 基本操作

| キー | 説明 |
|------|------|
| `<Space>` | リーダーキー |
| `;` | コマンドモード開始（:の代わり） |
| `jk` | Escapeキー（Insert/Cmdline/Terminal） |
| `<C-s>` | ファイル保存 |
| `<Esc>` | 検索ハイライトをクリア |

#### ウィンドウ/バッファ操作

| キー | 説明 |
|------|------|
| `<C-h/j/k/l>` | ウィンドウ移動 |
| `<S-h>` / `<S-l>` | バッファ移動（前/次） |
| `<leader>\|` | 垂直分割 |
| `<leader>-` | 水平分割 |
| `<leader>w=` | スプリットサイズを均等化 |
| `<leader>wm` | ウィンドウを最大化 |
| `<leader>bd` | バッファ削除 |
| `<leader>bo` | 他のバッファすべて削除 |

#### ファイル検索（Snacks Picker）

| キー | 説明 |
|------|------|
| `<leader><leader>` | Smart Picker（最近使用したファイル） |
| `<leader>sf` | ファイル検索 |
| `<leader>sg` | Grep検索 |
| `<leader>sw` | 単語Grep（Normal/Visual） |
| `<leader>sb` | バッファ検索 |
| `<leader>sr` | 最近のファイル |
| `<leader>sc` | コマンド検索 |
| `<leader>sh` | ヘルプページ検索 |
| `<leader>sk` | キーマップ検索 |
| `<leader>sd` | 診断検索 |
| `<leader>ss` | LSPシンボル検索 |
| `<leader>sR` | 最後のPicker再実行 |
| `<leader>sT` | TODOをTelescopeで検索 |

#### Telescope操作

| キー | 説明 |
|------|------|
| `<C-p>` / `<leader>ff` | ファイル検索 |
| `<leader>fg` | Live Grep |
| `<leader>fb` | バッファ検索 |
| `<leader>fh` | ヘルプタグ |
| `<leader>fr` | 最近のファイル |
| `<leader>fc` | Gitコミット |
| `<leader>fs` | Gitステータス |
| `<leader>fd` | 診断 |

#### LSP/コード操作

| キー | 説明 |
|------|------|
| `gD` | 宣言へ移動 |
| `gd` | 定義へ移動 |
| `gi` | 実装へ移動 |
| `gr` | 参照を表示 |
| `K` | ホバー情報 |
| `<leader>rn` | シンボル名変更 |
| `<leader>ca` | コードアクション |
| `<leader>fm` | バッファをフォーマット |
| `<leader>lk` | シグネチャヘルプ |
| `<leader>lD` | 型定義へ移動 |
| `[d` / `]d` | 前/次の診断エラーへ |
| `<leader>ld` | 行診断を浮動ウィンドウで表示 |

#### Git操作（Gitsigns）

| キー | 説明 |
|------|------|
| `]c` / `[c` | 次/前のHunk移動 |
| `<leader>gp` | Hunkプレビュー |
| `<leader>gb` | 行のBlame表示 |
| `<leader>gB` | Blame切り替え |
| `<leader>hr` | Hunkをリセット |
| `<leader>hs` | Hunkをステージ |
| `<leader>hu` | ステージ取消 |

#### Diffview操作

| キー | 説明 |
|------|------|
| `<leader>gd` | Git Diff（working tree） |
| `<leader>gD` | 前回コミットとの差分 |
| `<leader>gh` | ファイル履歴 |
| `<leader>gH` | ブランチ履歴 |
| `<leader>gq` | Diffviewクローズ |
| `<leader>gm` | mainブランチとの差分 |
| `<leader>gM` | masterブランチとの差分 |
| `<leader>gs` | ステージされた変更 |
| `<leader>gt` | ファイルパネル切り替え |
| `<leader>gg` / `<leader>gl` | LazyGit / ログビュー |
| `<leader>gf` | ファイル履歴 |

#### ファイルマネージャー（Oil）

| キー | 説明 |
|------|------|
| `-` | 親ディレクトリを開く |
| `<leader>e` | Oilを開く |
| `g?` | ヘルプ表示（Oil内） |
| `<Enter>` | ファイル/ディレクトリ選択 |
| `<C-v>` / `<C-s>` | 垂直/水平分割で開く |
| `g.` | 隠しファイル切り替え |

#### 高速ナビゲーション（Flash）

| キー | 説明 |
|------|------|
| `s` | Flashジャンプ（Normal/Visual/Operator） |
| `S` | Flash Treesitter |
| `r` | Remote Flash（Operator mode） |

#### Peek定義（Overlook）

| キー | 説明 |
|------|------|
| `<leader>pd` | 定義をポップアップで表示 |
| `<leader>pc` | すべてのポップアップをクローズ |
| `<leader>pu` | 最後のポップアップを復元 |
| `<leader>pU` | すべてのポップアップを復元 |
| `<leader>pf` | フォーカス切り替え |
| `<leader>ps` / `<leader>pv` | 分割/垂直分割で開く |
| `<leader>po` | 元のバッファで開く |

#### 診断パネル（Trouble）

| キー | 説明 |
|------|------|
| `<leader>xx` | 診断パネル（全体） |
| `<leader>xX` | 診断パネル（現在のバッファ） |
| `<leader>xs` | シンボルパネル |
| `<leader>xl` | LSP定義パネル |
| `<leader>xq` | Quickfixパネル |
| `<leader>xt` | TODOパネル |
| `]t` / `[t` | 次/前のTODOへ移動 |

#### Claude AI統合

| キー | 説明 |
|------|------|
| `<leader>cc` | Claude切り替え |
| `<leader>cf` | Claudeフォーカス |
| `<leader>cr` | Claudeを再開 |
| `<leader>cC` | Claudeを続行 |
| `<leader>cm` | Claudeモデル選択 |
| `<leader>cb` | 現在のバッファを追加 |
| `<leader>cs` | 選択テキストをClaudeに送信（Visual） |
| `<leader>ct` | ファイルツリーからファイル追加 |
| `<leader>aa` | Diffを受け入れ |
| `<leader>ad` | Diffを拒否 |

#### トグル操作

| キー | 説明 |
|------|------|
| `<leader>us` | スペルチェック切り替え |
| `<leader>uw` | 行折り返し切り替え |
| `<leader>ud` | 診断切り替え |
| `<leader>uh` | Inlay Hints切り替え |
| `<leader>tt` | ターミナル切り替え |

#### 補完（Insert mode）

| キー | 説明 |
|------|------|
| `<C-p>` / `<C-n>` | 前/次の補完候補 |
| `<C-d>` / `<C-f>` | ドキュメントスクロール |
| `<C-Space>` | 補完メニュー開く |
| `<C-e>` | 補完メニュー閉じる |
| `<Enter>` / `<Tab>` | 補完を選択/スニペット展開 |
| `<S-Tab>` | スニペット前のジャンプポイント |

#### その他

| キー | 説明 |
|------|------|
| `<leader>y` / `<leader>Y` | システムクリップボードにヤンク |
| `<leader>j` / `<leader>k` | Quickfixリスト移動 |
| `<leader>rr` | カーソル下の単語を置換 |
| `<leader>cx` | ファイルを実行可能にする（chmod +x） |
| `<leader>?` | Buffer Keymaps表示 |

### LSP対応言語

| 言語 | LSPサーバー |
|------|------------|
| Lua | lua_ls |
| TypeScript/JavaScript | ts_ls |
| Go | gopls |
| Python | pyright |
| Rust | rust_analyzer |
| HTML/CSS/JSON | html-lsp, css-lsp, json-lsp |
| YAML | yaml-language-server |
| Bash | bash-language-server |
| Terraform | terraform-ls |

### フォーマッター設定

| 言語 | フォーマッター |
|------|---------------|
| TypeScript/JavaScript | biome, prettier |
| Lua | stylua |
| Python | black, isort |
| Rust | rustfmt |
| Go | gofmt, goimports, gofumpt |
| Terraform | terraform_fmt |
| Bash | shfmt |
| YAML/Markdown | prettier |
| JSON | biome, prettier |

---

## Fish Shell設定

### エイリアス（Abbreviations）

#### ナビゲーション

| エイリアス | 展開 |
|-----------|------|
| `-` | `cd -` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |

#### Git

| エイリアス | 展開 |
|-----------|------|
| `g` | `git` |
| `ga` | `git add` |
| `gaa` | `git add --all` |
| `gc` | `git commit -v` |
| `gcm` | `git commit -m` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` |
| `gp` | `git push` |
| `gpl` | `git pull` |
| `gst` | `git status` |
| `gd` | `git diff` |
| `gl` | `git log --oneline` |
| `gf` | `git commit --amend --no-edit` |

#### Docker

| エイリアス | 展開 |
|-----------|------|
| `d` | `docker` |
| `dc` | `docker compose` |
| `dcu` | `docker compose up` |
| `dcd` | `docker compose down` |
| `dps` | `docker ps` |

#### Kubernetes

| エイリアス | 展開 |
|-----------|------|
| `k` | `kubectl` |
| `kgp` | `kubectl get pods` |
| `kgs` | `kubectl get svc` |
| `kgd` | `kubectl get deploy` |
| `kctx` | `kubectl config use-context` |
| `kns` | `kubectl config set-context --current --namespace` |

#### ツール

| エイリアス | 展開 |
|-----------|------|
| `c` | `claude` |
| `v` / `vi` / `vim` | `nvim` |
| `lg` | `lazygit` |

#### FZF統合

| エイリアス | 説明 |
|-----------|------|
| `ff` | ディレクトリ内ファイル検索 |
| `fgl` | Git log検索 |
| `fgs` | Git status検索 |
| `fp` | プロセス検索 |
| `fv` | 変数検索 |
| `fh` | 履歴検索（atuin） |
| `gb` | Gitブランチ切り替え |
| `kc` | Kubectlコンテキスト選択 |
| `de` | Dockerコンテナexec |
| `repo` | ghqリポジトリ選択 |

### 独自関数

| 関数 | 説明 |
|------|------|
| `ls` | ezaを使用（アイコン付き、ディレクトリ優先） |
| `ll` | ezaの長形式（git情報付き） |
| `la` | ezaですべて表示 |
| `lt` | ツリービュー（2階層まで） |
| `cat` | batを使用（シンタックスハイライト付き） |
| `grep` | ripgrepを使用 |
| `mkcd` | ディレクトリを作成してcd |
| `port` | ポート使用プロセスを確認 |
| `update_all` | 全ツール一括更新（Homebrew, mise, Claude CLI, Rust, Fisher, Neovim） |
| `ghq_fzf_repo` | fzfでリポジトリ選択してcd |
| `git_fzf_branch` | fzfでブランチ選択して切り替え |
| `kubectl_fzf_ctx` | fzfでKubectlコンテキスト選択 |
| `docker_fzf_exec` | fzfでDockerコンテナ選択してexec |

### キーバインド

| キー | 説明 |
|------|------|
| `Ctrl+G` | ghqリポジトリ選択（ghq_fzf_repo） |
| `Ctrl+B` | Gitブランチ選択（git_fzf_branch） |
| `Ctrl+L` | 画面クリア |
| `Ctrl+R` | 履歴検索（atuin） |

### Fisherプラグイン

| プラグイン | 説明 |
|-----------|------|
| jorgebucaran/fisher | パッケージマネージャー |
| decors/fish-ghq | ghq統合 |
| PatrickF1/fzf.fish | fzf統合 |
| danhper/fish-ssh-agent | SSH Agent |
| edc/bass | bash互換性 |
| nickeb96/puffer-fish | puffer-fish機能 |
| danhper/fish-fastdir | ディレクトリ移動最適化 |
| jorgebucaran/autopair.fish | 括弧の自動補完 |
| franciscolourenco/done | コマンド完了通知 |
| andreiborisov/sponge | コマンド履歴キャッシュ |

### 環境変数

```fish
# XDG Base Directory
XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_STATE_HOME=$HOME/.local/state
XDG_CACHE_HOME=$HOME/.cache

# エディタ
EDITOR=nvim
VISUAL=nvim
KUBE_EDITOR=nvim

# Docker
DOCKER_BUILDKIT=1
COMPOSE_DOCKER_CLI_BUILD=1

# bat
BAT_THEME=Dracula
BAT_STYLE=changes,header
MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Git
GIT_PAGER=delta
```

---

## miseで管理しているランタイム

| ランタイム | バージョン |
|-----------|-----------|
| Node.js | 22 |
| pnpm | 8.15.5 |
| Python | 3.12.6 |
| uv | latest |
| supabase | latest |
| yarn | latest |

---

## Ghostty設定

| 設定項目 | 値 |
|---------|-----|
| テーマ | Dracula |
| フォント | JetBrainsMono Nerd Font |
| フォントサイズ | 15 |
| 背景透過 | 70% |
| 背景ブラー | 20 |
| Quickターミナル | `Cmd+Shift+T`でトグル（中央表示） |

---

## 依存関係

このdotfilesは以下のツールがBrewfileでインストールされることを前提としています：

### 必須ツール

- `fish` - メインシェル
- `neovim` - エディタ
- `mise` - ランタイム管理
- `starship` - プロンプト
- `git`, `gh` - バージョン管理
- `fzf` - ファジーファインダー

### CLI強化ツール

- `eza` - ls代替
- `bat` - cat代替
- `ripgrep` - grep代替
- `fd` - find代替
- `zoxide` - cd強化
- `atuin` - 履歴管理
- `git-delta` - Git差分表示
- `lazygit` - Git TUI

### フォント

- `font-jetbrains-mono-nerd-font` - Ghostty/Neovimのフォント

### その他

- `im-select` - Neovimの日本語入力切替
- `ghq` - リポジトリ管理
