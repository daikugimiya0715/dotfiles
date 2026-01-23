# Neovim Configuration (NvChad v2.5)

## キーマップ一覧

`<leader>` = スペースキー

### 基本操作

：
| キー | モード | 機能 |
| ------- | ------ | ----------------------------- |
| `jk` | Insert | ノーマルモードに戻る |
| `;` | Normal | コマンドモード（`:`の代わり） |
| `<C-s>` | Normal | ファイル保存 |
| `<Esc>` | Normal | 検索ハイライトを消す |

### ナビゲーション

| キー    | モード | 機能                                     |
| ------- | ------ | ---------------------------------------- |
| `<C-d>` | Normal | 半ページ下スクロール（カーソル中央維持） |
| `<C-u>` | Normal | 半ページ上スクロール（カーソル中央維持） |
| `n`     | Normal | 次の検索結果（中央維持）                 |
| `N`     | Normal | 前の検索結果（中央維持）                 |

### ウィンドウ操作

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<C-h>`      | Normal | 左のウィンドウに移動     |
| `<C-j>`      | Normal | 下のウィンドウに移動     |
| `<C-k>`      | Normal | 上のウィンドウに移動     |
| `<C-l>`      | Normal | 右のウィンドウに移動     |
| `<leader>sv` | Normal | 縦分割                   |
| `<leader>sh` | Normal | 横分割                   |
| `<leader>se` | Normal | ウィンドウサイズを均等に |
| `<leader>sx` | Normal | ウィンドウを閉じる       |

### バッファ操作

| キー        | モード | 機能                       |
| ----------- | ------ | -------------------------- |
| `<S-h>`     | Normal | 前のバッファ               |
| `<S-l>`     | Normal | 次のバッファ               |
| `<leader>x` | Normal | バッファを閉じる（NvChad） |

### ファイルエクスプローラー (nvim-tree)

| キー         | モード | 機能                               |
| ------------ | ------ | ---------------------------------- |
| `<leader>e`  | Normal | エクスプローラーをトグル           |
| `<leader>fe` | Normal | エクスプローラーにフォーカス       |
| `<C-n>`      | Normal | エクスプローラーをトグル（NvChad） |

### ファイル検索 (Telescope)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>ff` | Normal | ファイル検索           |
| `<leader>fw` | Normal | 単語検索（grep）       |
| `<leader>fb` | Normal | バッファ一覧           |
| `<leader>fh` | Normal | ヘルプ検索             |
| `<leader>fo` | Normal | 最近開いたファイル     |
| `<leader>fz` | Normal | カレントバッファ内検索 |
| `<leader>gt` | Normal | Gitステータス          |

### LSP (コード補完・定義ジャンプ)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `gd`         | Normal | 定義へジャンプ         |
| `gD`         | Normal | 宣言へジャンプ         |
| `gr`         | Normal | 参照一覧               |
| `gi`         | Normal | 実装へジャンプ         |
| `K`          | Normal | ホバー情報表示         |
| `<leader>ca` | Normal | コードアクション       |
| `<leader>ra` | Normal | リネーム               |
| `<leader>fm` | Normal | フォーマット           |
| `[d`         | Normal | 前の診断へ             |
| `]d`         | Normal | 次の診断へ             |
| `<leader>lf` | Normal | フローティング診断表示 |

### 診断 (Trouble)

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<leader>xx` | Normal | 診断一覧をトグル         |
| `<leader>xX` | Normal | 現在のバッファの診断のみ |
| `<leader>cs` | Normal | シンボル一覧             |

### Git (gitsigns + lazygit)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>gg` | Normal | Lazygitを開く          |
| `]c`         | Normal | 次のhunkへ             |
| `[c`         | Normal | 前のhunkへ             |
| `<leader>gp` | Normal | hunkをプレビュー       |
| `<leader>gs` | Normal | hunkをステージ         |
| `<leader>gr` | Normal | hunkをリセット         |
| `<leader>gS` | Normal | バッファ全体をステージ |
| `<leader>gR` | Normal | バッファ全体をリセット |
| `<leader>gb` | Normal | 行のblame表示          |
| `<leader>gd` | Normal | diffを表示             |

### ターミナル

| キー          | モード   | 機能                     |
| ------------- | -------- | ------------------------ |
| `<leader>h`   | Normal   | 水平ターミナルをトグル   |
| `<leader>v`   | Normal   | 垂直ターミナルをトグル   |
| `<Esc><Esc>`  | Terminal | ターミナルモードを抜ける |
| `<C-h/j/k/l>` | Terminal | ウィンドウ間を移動       |
| `<C-\><C-h>`  | Terminal | 水平ターミナルをトグル   |
| `<C-\><C-v>`  | Terminal | 垂直ターミナルをトグル   |

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

### テーマだよ

| キー         | モード | 機能       |
| ------------ | ------ | ---------- |
| `<leader>th` | Normal | テーマ選択 |

### その他

| キー         | モード | 機能                       |
| ------------ | ------ | -------------------------- |
| `<leader>ch` | Normal | チートシート表示（NvChad） |
| `<leader>wK` | Normal | which-key全キーマップ      |
| `<leader>wk` | Normal | which-keyクエリ            |

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
