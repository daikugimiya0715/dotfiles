# Neovim Configuration (NvChad v2.5)

## キーマップ一覧

`<leader>` = スペースキー

### 基本操作

| キー    | モード               | 機能                          |
| ------- | -------------------- | ----------------------------- |
| `jk`    | Insert               | ノーマルモードに戻る          |
| `;`     | Normal               | コマンドモード（`:`の代わり） |
| `<C-s>` | Normal/Insert/Visual | ファイル保存                  |
| `<Esc>` | Normal               | 検索ハイライトを消す          |

### ナビゲーション

| キー    | モード | 機能                                     |
| ------- | ------ | ---------------------------------------- |
| `<C-d>` | Normal | 半ページ下スクロール（カーソル中央維持） |
| `<C-u>` | Normal | 半ページ上スクロール（カーソル中央維持） |
| `n`     | Normal | 次の検索結果（中央維持）                 |
| `N`     | Normal | 前の検索結果（中央維持）                 |
| `s`     | Normal | Flash ジャンプ                           |
| `S`     | Normal | Flash Treesitter                         |

### ウィンドウ操作

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<C-h>`      | Normal | 左のウィンドウに移動     |
| `<C-j>`      | Normal | 下のウィンドウに移動     |
| `<C-k>`      | Normal | 上のウィンドウに移動     |
| `<C-l>`      | Normal | 右のウィンドウに移動     |
| `<leader>\|` | Normal | 縦分割                   |
| `<leader>-`  | Normal | 横分割                   |
| `<leader>w=` | Normal | ウィンドウサイズを均等に |
| `<leader>wm` | Normal | ウィンドウを最大化       |

### バッファ操作

| キー         | モード | 機能                 |
| ------------ | ------ | -------------------- |
| `<S-h>`      | Normal | 前のバッファ         |
| `<S-l>`      | Normal | 次のバッファ         |
| `<leader>bd` | Normal | バッファを閉じる     |
| `<leader>bo` | Normal | 他のバッファを閉じる |

### ファイルエクスプローラー

| キー        | モード | 機能                        |
| ----------- | ------ | --------------------------- |
| `<leader>e` | Normal | NvimTreeをトグル            |
| `-`         | Normal | Oil（親ディレクトリを開く） |

### 検索 (Snacks Picker)

| キー               | モード        | 機能               |
| ------------------ | ------------- | ------------------ |
| `<leader><leader>` | Normal        | スマートピッカー   |
| `<leader>sf`       | Normal        | ファイル検索       |
| `<leader>sg`       | Normal        | Grep検索           |
| `<leader>sw`       | Normal/Visual | 単語検索           |
| `<leader>sb`       | Normal        | バッファ一覧       |
| `<leader>sr`       | Normal        | 最近開いたファイル |
| `<leader>sc`       | Normal        | コマンド一覧       |
| `<leader>sh`       | Normal        | ヘルプ検索         |
| `<leader>sk`       | Normal        | キーマップ検索     |
| `<leader>sd`       | Normal        | 診断一覧           |
| `<leader>ss`       | Normal        | LSPシンボル        |
| `<leader>sR`       | Normal        | 前回の検索を再開   |
| `<leader>sT`       | Normal        | TODO検索           |

### 検索 (Telescope)

| キー         | モード | 機能                  |
| ------------ | ------ | --------------------- |
| `<leader>ff` | Normal | ファイル検索          |
| `<leader>fg` | Normal | Live Grep             |
| `<leader>fb` | Normal | バッファ一覧          |
| `<leader>fh` | Normal | ヘルプ検索            |
| `<leader>fr` | Normal | 最近開いたファイル    |
| `<leader>fc` | Normal | Gitコミット           |
| `<leader>fs` | Normal | Gitステータス         |
| `<leader>fd` | Normal | 診断一覧              |
| `<leader>fo` | Normal | 最近開いたファイル    |
| `<leader>fw` | Normal | Live Grep（カレント） |
| `<leader>fz` | Normal | カレントバッファ検索  |
| `<leader>fa` | Normal | 全ファイル検索        |
| `<leader>ma` | Normal | マーク一覧            |
| `<leader>pt` | Normal | ターミナル一覧        |
| `<leader>cm` | Normal | Gitコミット履歴       |
| `<C-p>`      | Normal | ファイル検索          |

### LSP (コード補完・定義ジャンプ)

| キー         | モード        | 機能                   |
| ------------ | ------------- | ---------------------- |
| `gd`         | Normal        | 定義へジャンプ         |
| `gD`         | Normal        | 宣言へジャンプ         |
| `gr`         | Normal        | 参照一覧               |
| `gi`         | Normal        | 実装へジャンプ         |
| `K`          | Normal        | ホバー情報表示         |
| `<leader>ca` | Normal/Visual | コードアクション       |
| `<leader>rn` | Normal        | リネーム               |
| `<leader>fm` | Normal        | フォーマット           |
| `[d`         | Normal        | 前の診断へ             |
| `]d`         | Normal        | 次の診断へ             |
| `<leader>ld` | Normal        | フローティング診断表示 |
| `<leader>lk` | Normal        | シグネチャヘルプ       |
| `<leader>lD` | Normal        | 型定義へジャンプ       |
| `<leader>ds` | Normal        | 診断をloclistに表示    |

### 診断 (Trouble)

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<leader>xx` | Normal | 診断一覧をトグル         |
| `<leader>xX` | Normal | 現在のバッファの診断のみ |
| `<leader>xs` | Normal | シンボル一覧             |
| `<leader>xl` | Normal | LSP定義                  |
| `<leader>xq` | Normal | Quickfixリスト           |
| `<leader>xt` | Normal | TODOリスト               |
| `]t`         | Normal | 次のTODOへ               |
| `[t`         | Normal | 前のTODOへ               |

### Git (gitsigns + lazygit + diffview)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>gg` | Normal | Lazygitを開く          |
| `<leader>gl` | Normal | Lazygit Log            |
| `<leader>gf` | Normal | Lazygit ファイルログ   |
| `]c`         | Normal | 次のhunkへ             |
| `[c`         | Normal | 前のhunkへ             |
| `<leader>gp` | Normal | hunkをプレビュー       |
| `<leader>hs` | Normal | hunkをステージ         |
| `<leader>hr` | Normal | hunkをリセット         |
| `<leader>hu` | Normal | ステージを取り消す     |
| `<leader>gb` | Normal | 行のblame表示          |
| `<leader>gB` | Normal | blame表示をトグル      |
| `<leader>gd` | Normal | Diffviewを開く         |
| `<leader>gD` | Normal | 前のコミットとdiff     |
| `<leader>gh` | Normal | ファイル履歴           |
| `<leader>gH` | Normal | ブランチ履歴           |
| `<leader>gq` | Normal | Diffviewを閉じる       |
| `<leader>gm` | Normal | mainブランチとdiff     |
| `<leader>gM` | Normal | masterブランチとdiff   |
| `<leader>gs` | Normal | ステージ済み変更       |
| `<leader>gt` | Normal | Git status (Telescope) |

### ターミナル

| キー          | モード   | 機能                     |
| ------------- | -------- | ------------------------ |
| `<leader>tt`  | Normal   | ターミナルをトグル       |
| `<leader>h`   | Normal   | ターミナル（水平分割）   |
| `<leader>v`   | Normal   | ターミナル（垂直分割）   |
| `<C-x>`       | Terminal | ターミナルモードを抜ける |
| `<C-h/j/k/l>` | Terminal | ウィンドウ間を移動       |

### Peek (overlook.nvim)

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<leader>pd` | Normal | 定義をプレビュー         |
| `<leader>pc` | Normal | 全ポップアップを閉じる   |
| `<leader>pu` | Normal | 最後のポップアップを復元 |
| `<leader>pU` | Normal | 全ポップアップを復元     |
| `<leader>pf` | Normal | フォーカスをトグル       |
| `<leader>ps` | Normal | 分割で開く               |
| `<leader>pv` | Normal | 縦分割で開く             |
| `<leader>po` | Normal | 元の場所で開く           |

### 編集

| キー         | モード        | 機能                               |
| ------------ | ------------- | ---------------------------------- |
| `J`          | Visual        | 選択行を下に移動                   |
| `K`          | Visual        | 選択行を上に移動                   |
| `<leader>p`  | Visual        | レジスタを上書きせずペースト       |
| `<leader>d`  | Normal/Visual | ヤンクせずに削除                   |
| `<leader>y`  | Normal/Visual | システムクリップボードにコピー     |
| `<leader>Y`  | Normal        | 行をシステムクリップボードにコピー |
| `<leader>rr` | Normal        | カーソル下の単語を一括置換         |
| `<leader>cx` | Normal        | ファイルを実行可能にする           |
| `<leader>j`  | Normal        | 次のquickfix                       |
| `<leader>k`  | Normal        | 前のquickfix                       |

### トグル

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>us` | Normal | スペルチェックをトグル |
| `<leader>uw` | Normal | 折り返しをトグル       |
| `<leader>ud` | Normal | 診断をトグル           |
| `<leader>uh` | Normal | Inlay Hintsをトグル    |
| `<leader>n`  | Normal | 行番号をトグル         |

### NvChad機能

| キー         | モード        | 機能                   |
| ------------ | ------------- | ---------------------- |
| `<leader>/`  | Normal/Visual | コメントトグル         |
| `<leader>x`  | Normal        | バッファを閉じる       |
| `<leader>b`  | Normal        | 新規バッファ           |
| `<leader>wK` | Normal        | which-key 全キーマップ |
| `<leader>wk` | Normal        | which-key カーソル下   |
| `<leader>ch` | Normal        | NvCheatsheet           |
| `<leader>th` | Normal        | テーマ選択             |

### Claude Code (claude.nvim)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>cc` | Normal | Claude をトグル        |
| `<leader>cf` | Normal | Claude にフォーカス    |
| `<leader>cb` | Normal | 現在のバッファを追加   |
| `<leader>cs` | Visual | 選択範囲をClaudeに送信 |
| `<leader>aa` | Normal | Diffを適用             |
| `<leader>ad` | Normal | Diffを拒否             |
| `<leader>cC` | Normal | Claude を継続          |
| `<leader>cr` | Normal | Claude を再開          |

### その他

| キー        | モード | 機能                     |
| ----------- | ------ | ------------------------ |
| `<leader>?` | Normal | バッファのキーマップ表示 |

---

## ファイル構成

```
nvim/
├── init.lua                 # エントリーポイント（NvChad読み込み）
└── lua/
    ├── chadrc.lua           # テーマ・UI設定
    ├── options.lua          # Vimオプション
    ├── mappings.lua         # カスタムキーマップ
    ├── configs/
    │   ├── lazy.lua         # lazy.nvim設定
    │   ├── lspconfig.lua    # LSPサーバー設定
    │   └── conform.lua      # フォーマッター設定
    └── plugins/
        └── init.lua         # プラグイン定義
```

## インストール済みLSP

- **Lua**: lua_ls
- **TypeScript/JavaScript**: ts_ls
- **Go**: gopls
- **Python**: pyright
- **Rust**: rust_analyzer

## フォーマッター

| 言語   | フォーマッター              |
| ------ | --------------------------- |
| Lua    | stylua                      |
| JS/TS  | biome → prettier (fallback) |
| Go     | gofumpt, goimports          |
| Python | ruff                        |
| Rust   | rustfmt                     |
