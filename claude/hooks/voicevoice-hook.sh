#!/bin/bash
# voicevoice - Claude Code auto-speak hook (Stop イベント)
# 最後のアシスタント発言を VOICEVOX（ずんだもん）で読み上げる

FLAG="$HOME/.voicevoice_enabled"
JQ=/opt/homebrew/bin/jq

# 有効化フラグがなければ何もしない
[ ! -f "$FLAG" ] && exit 0

# voicevoice CLI を探す
VOICEVOICE=""
for p in /usr/local/bin/voicevoice "$HOME/bin/voicevoice"; do
  [ -x "$p" ] && VOICEVOICE="$p" && break
done
[ -z "$VOICEVOICE" ] && exit 0

# Stop フックの stdin JSON から transcript_path を取得
TRANSCRIPT=$("$JQ" -r '.transcript_path // empty' 2>/dev/null)
[ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ] && exit 0

# 最終メッセージの書き込みがフック発火より遅れることがあるため少し待つ
sleep 2

# transcript(JSONL) から最後のアシスタントのテキスト発言を抽出
TEXT=$("$JQ" -rs '
  [ .[] | select(.type == "assistant")
    | .message.content
    | if type == "array" then (map(select(.type == "text") | .text) | join("\n")) else . end
    | select(. != null and . != "") ]
  | last // empty
' "$TRANSCRIPT" 2>/dev/null)
[ -z "$TEXT" ] && exit 0

# コードブロック・URL・記号を読み上げ用に軽く整形
TEXT=$(printf '%s' "$TEXT" \
  | sed -E '/^```/,/^```/d' \
  | sed -E 's#https?://[^ )]+#URL#g; s/[*#`|>-]+/ /g' \
  | tr -s ' \n' ' ')

# 長文は切り詰め
if [ ${#TEXT} -gt 300 ]; then
  TEXT="${TEXT:0:300}。以下省略なのだ。"
fi

# バックグラウンドで読み上げ
"$VOICEVOICE" "$TEXT" > /dev/null 2>&1 &
exit 0
