# Global CLAUDE.md（kugimiya 個人・全プロジェクト共通）

## herdr worktree のラベル規約

herdr 管理下（`HERDR_ENV=1`）で git worktree を作成・オープンして workspace ができたときは、その workspace のラベルを **worktree のディレクトリ名に一致**させること。

- worktree は**ブランチ単位ではなくテーマ（案件）単位**で作り、長く使う。ディレクトリ名はテーマ名にし、`kugimiya-` 接頭辞は付けない（ブランチ名はサイドバーの branch 行に出るのでラベルに含めない）。
  - 例: ブランチ `kugimiya/fastbi-karte-check-roi` → `--path ~/.herdr/worktrees/mental-online-karte/fastbi --label fastbi`。
  - 2026-09-11 以前に作った `kugimiya-*` ディレクトリは改名しない（Claude の履歴保存先が cwd 由来のため）。ラベルだけ接頭辞を落としてよい。
- `herdr worktree create` を使うときは `--path` と `--label` を必ず明示し、両方に同じテーマ名を渡す。
- repo グループの親 workspace（`herdr worktree list` の `source_workspace_id`）を close 候補に挙げるときは、配下の worktree workspace が全部連鎖で閉じることを必ず警告する。
- 既存 workspace のラベルが worktree 名とずれているのに気づいたら、`herdr workspace rename <workspace_id> "<ディレクトリ名>"` で揃えてよい（ユーザー確認不要）。
- worktree を持たない workspace（メインチェックアウトや単発シェル）はこの規約の対象外。
