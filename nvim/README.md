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

| キー    | モード                 | 機能                                     |
| ------- | ---------------------- | ---------------------------------------- |
| `<C-d>` | Normal                 | 半ページ下スクロール（カーソル中央維持） |
| `<C-u>` | Normal                 | 半ページ上スクロール（カーソル中央維持） |
| `n`     | Normal                 | 次の検索結果（中央維持）                 |
| `N`     | Normal                 | 前の検索結果（中央維持）                 |
| `s`     | Normal/Visual/Operator | Flash ジャンプ                           |
| `S`     | Normal/Visual/Operator | Flash Treesitter                         |
| `r`     | Operator               | Remote Flash                             |

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

| キー        | モード | 機能                       |
| ----------- | ------ | -------------------------- |
| `<leader>e` | Normal | NvimTreeをトグル           |
| `<leader>E` | Normal | 現在のファイルをTreeで表示 |

### 検索 (Snacks Picker)

| キー               | モード        | 機能               |
| ------------------ | ------------- | ------------------ |
| `<leader><leader>` | Normal        | スマートピッカー   |
| `<leader>ff`       | Normal        | ファイル検索       |
| `<leader>fg`       | Normal        | Grep検索           |
| `<leader>fw`       | Normal/Visual | 単語検索           |
| `<leader>fb`       | Normal        | バッファ一覧       |
| `<leader>fr`       | Normal        | 最近開いたファイル |
| `<leader>fc`       | Normal        | コマンド一覧       |
| `<leader>fh`       | Normal        | ヘルプ検索         |
| `<leader>fk`       | Normal        | キーマップ検索     |
| `<leader>fd`       | Normal        | 診断一覧           |
| `<leader>fs`       | Normal        | LSPシンボル        |
| `<leader>fR`       | Normal        | 前回の検索を再開   |
| `<C-p>`            | Normal        | ファイル検索       |

### LSP (コード補完・定義ジャンプ)

| キー          | モード        | 機能                       |
| ------------- | ------------- | -------------------------- |
| `gd`          | Normal        | 定義へジャンプ             |
| `gD`          | Normal        | 宣言へジャンプ             |
| `gr`          | Normal        | 参照一覧                   |
| `gi`          | Normal        | 実装へジャンプ             |
| `K`           | Normal        | ホバー情報表示             |
| `<leader>ca`  | Normal/Visual | コードアクション           |
| `<leader>rn`  | Normal        | リネーム                   |
| `<leader>cf`  | Normal        | フォーマット               |
| `[d`          | Normal        | 前の診断へ                 |
| `]d`          | Normal        | 次の診断へ                 |
| `<leader>ld`  | Normal        | フローティング診断表示     |
| `<leader>lq`  | Normal        | 診断をloclistに表示        |
| `<leader>lk`  | Normal        | シグネチャヘルプ           |
| `<leader>lD`  | Normal        | 型定義へジャンプ           |
| `<leader>lwa` | Normal        | ワークスペースフォルダ追加 |
| `<leader>lwr` | Normal        | ワークスペースフォルダ削除 |
| `<leader>lwl` | Normal        | ワークスペースフォルダ一覧 |

### 診断 (Snacks Picker)

| キー         | モード | 機能                     |
| ------------ | ------ | ------------------------ |
| `<leader>xx` | Normal | ワークスペース全体の診断 |
| `<leader>xX` | Normal | 現在のバッファの診断のみ |
| `<leader>xs` | Normal | LSPシンボル一覧          |
| `<leader>xq` | Normal | Quickfixリスト           |

### Git (gitsigns + lazygit + diffview)

| キー         | モード | 機能                           |
| ------------ | ------ | ------------------------------ |
| `<leader>gg` | Normal | Lazygitを開く                  |
| `<leader>gl` | Normal | Lazygit Log                    |
| `<leader>gf` | Normal | Lazygit ファイルログ           |
| `]c`         | Normal | 次のhunkへ                     |
| `[c`         | Normal | 前のhunkへ                     |
| `<leader>gp` | Normal | hunkをプレビュー               |
| `<leader>gs` | Normal | hunkをステージ                 |
| `<leader>gr` | Normal | hunkをリセット                 |
| `<leader>gu` | Normal | ステージを取り消す             |
| `<leader>gb` | Normal | 行のblame表示                  |
| `<leader>gB` | Normal | blame表示をトグル              |
| `<leader>gd` | Normal | Diffviewを開く                 |
| `<leader>gD` | Normal | 前のコミットとdiff             |
| `<leader>gh` | Normal | ファイル履歴                   |
| `<leader>gH` | Normal | ブランチ履歴                   |
| `<leader>gq` | Normal | Diffviewを閉じる               |
| `<leader>gm` | Normal | mainブランチとdiff             |
| `<leader>gM` | Normal | masterブランチとdiff           |
| `<leader>gS` | Normal | ステージ済み変更をdiff         |
| `<leader>gt` | Normal | Diffviewファイルパネルをトグル |

### ターミナル

| キー          | モード   | 機能                                 |
| ------------- | -------- | ------------------------------------ |
| `<leader>tt`  | Normal   | ターミナル（tmuxセッション連携）     |
| `<leader>tq`  | Normal   | tmuxセッションをkill                 |
| `<leader>th`  | Normal   | ターミナル（水平分割）               |
| `<leader>tv`  | Normal   | ターミナル（垂直分割）               |
| `<leader>Q`   | Normal   | LazyDocker                           |
| `<C-x>`       | Terminal | ターミナルモードを抜ける             |
| `<C-h/j/k/l>` | Terminal | ウィンドウ間を移動（非floatingのみ） |

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

### Claude Code (AI)

| キー         | モード | 機能                                |
| ------------ | ------ | ----------------------------------- |
| `<leader>ac` | Normal | Claude をトグル                     |
| `<leader>af` | Normal | Claude にフォーカス                 |
| `<leader>ar` | Normal | Claude を再開 (--resume)            |
| `<leader>aR` | Normal | Claude を継続 (--continue)          |
| `<leader>am` | Normal | Claude モデル選択                   |
| `<leader>ab` | Normal | 現在のバッファを追加                |
| `<leader>as` | Visual | 選択範囲をClaudeに送信              |
| `<leader>at` | Normal | ファイルツリーから追加 (NvimTree内) |
| `<leader>aa` | Normal | Diffを適用                          |
| `<leader>ad` | Normal | Diffを拒否                          |

### Rust (rustaceanvim)

| キー         | モード | 機能               |
| ------------ | ------ | ------------------ |
| `<leader>rt` | Normal | テスト実行         |
| `<leader>re` | Normal | エラー説明         |
| `<leader>rR` | Normal | 実行可能一覧       |
| `<leader>rm` | Normal | マクロ展開         |
| `<leader>rc` | Normal | Cargo.tomlを開く   |
| `<leader>rp` | Normal | 親モジュールへ     |
| `<leader>rd` | Normal | 診断をレンダリング |
| `<leader>rD` | Normal | デバッグ可能一覧   |
| `<leader>rs` | Normal | 構造的検索置換     |

### Crates (Cargo.toml)

| キー         | モード | 機能                   |
| ------------ | ------ | ---------------------- |
| `<leader>cv` | Normal | クレートバージョン     |
| `<leader>cu` | Normal | クレート更新           |
| `<leader>cU` | Normal | クレートアップグレード |
| `<leader>cA` | Normal | 全クレート更新         |
| `<leader>cF` | Normal | クレートfeatures       |

### デバッグ (DAP)

| キー         | モード        | 機能               |
| ------------ | ------------- | ------------------ |
| `<leader>db` | Normal        | ブレークポイント   |
| `<leader>dc` | Normal        | 続行               |
| `<leader>di` | Normal        | ステップイン       |
| `<leader>do` | Normal        | ステップオーバー   |
| `<leader>dO` | Normal        | ステップアウト     |
| `<leader>dr` | Normal        | REPLをトグル       |
| `<leader>dl` | Normal        | 前回の実行を再実行 |
| `<leader>dt` | Normal        | 終了               |
| `<leader>du` | Normal        | DAP UIをトグル     |
| `<leader>de` | Normal/Visual | 式を評価           |

### NvChad機能

| キー         | モード        | 機能                   |
| ------------ | ------------- | ---------------------- |
| `<leader>/`  | Normal/Visual | コメントトグル         |
| `<leader>?`  | Normal        | バッファキーマップ表示 |
| `<leader>ch` | Normal        | NvCheatsheet           |

### 補完 (nvim-cmp)

| キー        | モード | 機能                        |
| ----------- | ------ | --------------------------- |
| `<C-p>`     | Insert | 前の補完候補                |
| `<C-n>`     | Insert | 次の補完候補                |
| `<C-d>`     | Insert | ドキュメント上スクロール    |
| `<C-f>`     | Insert | ドキュメント下スクロール    |
| `<C-Space>` | Insert | 補完メニュー表示            |
| `<C-e>`     | Insert | 補完メニュー閉じる          |
| `<CR>`      | Insert | 補完確定                    |
| `<Tab>`     | Insert | 次候補選択 / スニペット展開 |
| `<S-Tab>`   | Insert | 前候補選択 / スニペット前へ |

### Diffview内キーマップ

| キー         | モード | 機能                  |
| ------------ | ------ | --------------------- |
| `<tab>`      | Normal | 次のファイル          |
| `<s-tab>`    | Normal | 前のファイル          |
| `gf`         | Normal | ファイルを開く        |
| `[x` / `]x`  | Normal | 前/次のコンフリクト   |
| `<leader>co` | Normal | Ours を選択           |
| `<leader>ct` | Normal | Theirs を選択         |
| `<leader>cb` | Normal | Base を選択           |
| `<leader>ca` | Normal | All を選択            |
| `dx`         | Normal | コンフリクト削除      |
| `-` / `s`    | Normal | ステージ/アンステージ |
| `S`          | Normal | 全てステージ          |
| `U`          | Normal | 全てアンステージ      |
| `X`          | Normal | エントリを復元        |
| `L`          | Normal | コミットログを開く    |

---

## ファイル構成

```
nvim/
├── init.lua                 # エントリーポイント（lazy.nvim + NvChad読み込み）
└── lua/
    ├── chadrc.lua           # NvChadテーマ・UI・ダッシュボード設定
    ├── options.lua          # Vimオプション・autocmd
    ├── mappings.lua         # カスタムキーマップ（メイン）
    ├── configs/
    │   ├── lazy.lua         # lazy.nvim設定（パフォーマンス・無効化プラグイン）
    │   ├── conform.lua      # (未使用) conform設定 ※plugins/lsp.luaのインライン設定で上書き済み
    │   └── lspconfig.lua    # LSPサーバー設定（Neovim 0.11+ native API）
    └── plugins/
        ├── init.lua         # プラグインアグリゲータ（全モジュールをmerge）
        ├── ui.lua           # incline, modes, noice, notify, vimade, better-escape, which-key, indent-blankline, scrollbar
        ├── navigation.lua   # snacks, flash, nvim-tree, hbac, overlook
        ├── git.lua          # gitsigns, diffview
        ├── diagnostics.lua  # Snacks picker診断キーマップ
        ├── lsp.lua          # conform, lspconfig, mason, schemastore, treesitter
        ├── ai.lua           # claudecode.nvim
        ├── completion.lua   # nvim-cmp
        └── lang.lua         # crates, rustaceanvim, nvim-dap, nvim-dap-ui, marp, markdown-preview, render-markdown, img-clip
```

## インストール済みLSP

- **Lua**: lua_ls
- **TypeScript/JavaScript**: ts_ls, deno, eslint-lsp
- **Go**: gopls
- **Python**: pyright, ruff
- **Rust**: rust-analyzer (rustaceanvim経由)
- **Terraform**: terraform-ls
- **Bash**: bash-language-server
- **HTML/CSS**: html-lsp, css-lsp, emmet-ls
- **JSON**: json-lsp
- **YAML**: yaml-language-server

## フォーマッター

| 言語       | フォーマッター            |
| ---------- | ------------------------- |
| Lua        | stylua                    |
| JS/TS      | prettier, deno_fmt        |
| Go         | gofmt, goimports, gofumpt |
| Python     | black, isort              |
| Rust       | rustfmt                   |
| Terraform  | terraform_fmt             |
| Bash/Shell | shfmt                     |
| YAML/JSON  | prettier                  |
| Markdown   | prettier                  |

