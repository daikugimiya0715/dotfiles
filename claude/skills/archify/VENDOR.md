# archify（vendored）

上流: https://github.com/tt-a1i/archify (MIT)

- vendored version: `2.17.0-dev.1`（`skill-release.json` 参照）
- 取得元: リポジトリ同梱の `archify.zip`
- 取り込み時の上流 main: `72c750bb070d`（2026-09-16）
- 導入日: 2026-09-19

`npx skills add` は使わず、`archify.zip` を展開して dotfiles に vendoring している。
`~/.claude/skills/archify` へのシンボリックリンクは `setup.sh` が
`claude/skills/*/` を舐めて自動で張るので、設定の追加は不要。

## 更新手順

```sh
cd /tmp && curl -sLO https://raw.githubusercontent.com/tt-a1i/archify/main/archify.zip
unzip -q -o archify.zip -d /tmp/archify-new
rm -rf ~/source/dotfiles/claude/skills/archify
cp -R /tmp/archify-new/archify ~/source/dotfiles/claude/skills/archify
rm -f ~/source/dotfiles/claude/skills/archify/examples/*.html   # ← 下記
cd ~/source/dotfiles/claude/skills/archify && node bin/archify.mjs doctor
```

## 上流から削っているもの

`examples/*.html`（レンダリング済みデモ 5 本 / 計 4.0MB）を削除している。
これで 6.4MB → 2.5MB。

削って安全な根拠:

- authoring フロー（SKILL.md）が読むのは `examples/*.json` だけ
- `*.html` を参照しているのは各 JSON の `meta.output` 値と、
  上流のビルドスクリプト `scripts/render-examples.mjs` のみ
- 削除後も `doctor` は 15 項目すべて ok

## 素振りの記録

シーケンス図 1 枚を実際に通した結果:

- `validate --quality showcase --json` は 2 回落ちた。
  自己メッセージ（`from == to`）は非対応で `spans 0px (minimum 60px)`、
  同じ横位置を共有するメッセージの y 間隔は 28px 以上必要。
- `composition/desktop-readability` は 1440px 実機換算のフォントサイズで落とす
  （`sourceFontPx 7 → projectedFontPx 5.71 / minimum 6`）。viewBox 幅で調整する。
- participant の `label` は 129px ボックスに収まる長さまで。長い名前は `sublabel` へ。
- `note` は `data-detail="fine"` の 7px テキストで、既定の detail 状態では**描画されない**。
  読ませたい補足は `cards` に書く。
- `visual-check` はローカル Chrome を使って PNG を 4 枚
  （1440x900 / 2048x1320 × light / dark）と実測値 JSON を吐く。
  CLI から画像が欲しいときはこれ。SVG / WebM はブラウザの Export メニューのみ。
