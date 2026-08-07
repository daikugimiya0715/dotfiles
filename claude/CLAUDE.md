# Global CLAUDE.md（kugimiya 個人・全プロジェクト共通）

## herdr worktree のラベル規約

herdr 管理下（`HERDR_ENV=1`）で git worktree を作成・オープンして workspace ができたときは、その workspace のラベルを **worktree のディレクトリ名に一致**させること。

- 例: checkout_path が `~/.herdr/worktrees/mental-online-karte/kugimiya-shindansho` → ラベルは `kugimiya-shindansho`。
- `herdr worktree create` を使うときは `--label` に最初から worktree ディレクトリ名（branch-slug）を渡す。
- 既存 workspace のラベルが worktree 名とずれているのに気づいたら、`herdr workspace rename <workspace_id> "<ディレクトリ名>"` で揃えてよい（ユーザー確認不要）。
- worktree を持たない workspace（メインチェックアウトや単発シェル）はこの規約の対象外。
