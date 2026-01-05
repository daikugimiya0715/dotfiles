### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/daichikugimiya/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

set -x DOCKER_HOST "unix:///Users/daichikugimiya/.rd/docker.sock"

# HomebrewのPATH設定
fish_add_path /opt/homebrew/bin

# miseの有効化 (miseのドキュメントでfish用のコマンドを確認してください)
# 例:
if status is-interactive; and command -q mise
    mise activate fish | source
end

# pnpm
set -gx PNPM_HOME "/Users/daichikugimiya/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Starship prompt
starship init fish | source
