-- 折りたたみ行の見た目を VSCode 風にする
--
--   function foo(a, b) { ⋯ }  12 lines
--
-- 1行目（関数シグネチャ）はコードと同じシンタックスハイライトで残し、
-- 中身だけを ⋯ マーカーに畳んで、閉じ括弧と行数を後ろに添える。

local M = {}

--- ⋯ マーカーと行数表示のハイライトをテーマ色から作る
function M.setup_highlights()
	local ok, base46 = pcall(require, "base46")
	local c = ok and base46.get_theme_tb("base_30") or {}

	-- マーカーは背景色を付けて「ここが畳まれている」と一目で分かるようにする
	vim.api.nvim_set_hl(0, "FoldMarker", {
		fg = c.black or "#1e1e2e",
		bg = c.purple or "#a6a3e0",
		bold = true,
	})
	vim.api.nvim_set_hl(0, "FoldLineCount", {
		fg = c.grey_fg or "#6c7086",
		italic = true,
	})
end

--- 指定行を treesitter のハイライト付き chunk 列に変換する
---@param lnum integer 1-indexed
---@return table[] chunks { text, hl_group } の配列
local function highlighted_chunks(lnum)
	local line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1] or ""
	local plain = { { line, "Normal" } }

	local ok, parser = pcall(vim.treesitter.get_parser, 0)
	if not ok or not parser then
		return plain
	end

	local query = vim.treesitter.query.get(parser:lang(), "highlights")
	local tree = parser:parse({ lnum - 1, lnum })[1]
	if not query or not tree then
		return plain
	end

	local chunks = {}
	local pos = 0
	for id, node in query:iter_captures(tree:root(), 0, lnum - 1, lnum) do
		local srow, scol, erow, ecol = node:range()
		-- 対象行に収まっていて、まだ着色していない範囲だけを拾う
		if srow == lnum - 1 and erow == lnum - 1 and scol >= pos then
			if scol > pos then
				table.insert(chunks, { line:sub(pos + 1, scol), "Normal" })
			end
			table.insert(chunks, { line:sub(scol + 1, ecol), "@" .. query.captures[id] })
			pos = ecol
		end
	end
	if pos < #line then
		table.insert(chunks, { line:sub(pos + 1), "Normal" })
	end

	return #chunks > 0 and chunks or plain
end

function M.foldtext()
	local fstart, fend = vim.v.foldstart, vim.v.foldend
	local chunks = highlighted_chunks(fstart)

	-- 1行目の末尾の空白を落とす（"{  " → "{"）
	local last = chunks[#chunks]
	if last then
		last[1] = last[1]:gsub("%s+$", "")
	end

	table.insert(chunks, { " ⋯ ", "FoldMarker" })

	-- 閉じ括弧だけの行（"}" / "});" など）なら、対応が見えるように後ろに出す。
	-- python のように最終行が普通のコードになる言語では出さない。
	local closing = vim.trim(vim.api.nvim_buf_get_lines(0, fend - 1, fend, false)[1] or "")
	if closing:match("^[%)%]%}%,%;]+$") then
		table.insert(chunks, { closing, "Normal" })
	end

	table.insert(chunks, { ("  %d lines"):format(fend - fstart + 1), "FoldLineCount" })

	return chunks
end

return M
