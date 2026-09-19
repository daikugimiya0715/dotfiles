---@type ChadrcConfig
local M = {}

-- statusline のパス短縮設定
local PATH_TAIL_KEEP = 5 -- ファイル名から数えてこの数のパス要素はそのまま出す
local PATH_MAX_LEN = 70 -- これを超えたときだけ先頭側を潰す

--- 末尾 PATH_TAIL_KEEP 要素は残したまま、先頭側のディレクトリ名だけを頭文字に潰す。
--- 例: projects/online-ops-service/api/src/pharmacy/workers/jobs/foo.job.ts
---  -> p/o/a/src/pharmacy/workers/jobs/foo.job.ts
local function shorten_path(name)
	if #name <= PATH_MAX_LEN then
		return name
	end

	local parts = vim.split(name, "/", { plain = true })
	if #parts <= PATH_TAIL_KEEP then
		return name -- 潰す余地がない（深さが足りない）
	end

	local out = {}
	for i, part in ipairs(parts) do
		if i > #parts - PATH_TAIL_KEEP then
			out[i] = part
		elseif part:sub(1, 1) == "." then
			out[i] = part:sub(1, 2) -- ドットディレクトリは "." の次まで残す
		else
			out[i] = part:sub(1, 1)
		end
	end

	return table.concat(out, "/")
end

M.base46 = {
	theme = "chadracula",
	transparency = true,
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		WinSeparator = { fg = "#808080", bg = "NONE" },
		-- 折りたたみ行は灰色ベタ塗りにせず、元のコードの色を活かす
		Folded = { bg = "NONE" },
	},
}

M.ui = {
	statusline = {
		theme = "default",
		modules = {
			-- NvChad 既定の file モジュールはファイル名だけを出すので、
			-- cwd（nvim を起動した場所）からの相対パスを出すように差し替える。
			file = function()
				local utils = require("nvchad.stl.utils")
				local sep = utils.separators.default.right
				local path = vim.api.nvim_buf_get_name(utils.stbufnr())

				if path == "" then
					return "%#St_file# 󰈚 Empty %#St_file_sep#" .. sep
				end

				-- cwd 配下なら相対パス、外に出たら ~ 付きのパスにフォールバックする
				local name = shorten_path(vim.fn.fnamemodify(path, ":~:."))

				local icon = "󰈚"
				local devicons_present, devicons = pcall(require, "nvim-web-devicons")
				if devicons_present then
					icon = devicons.get_icon(vim.fn.fnamemodify(path, ":t")) or icon
				end

				return "%#St_file# " .. icon .. " " .. name .. " %#St_file_sep#" .. sep
			end,
		},
	},
	tabufline = {
		enabled = true,
	},
}

M.nvdash = {
	load_on_startup = true,
	buttons = {
		{ txt = "  Find File", keys = "ff", cmd = "lua Snacks.picker.files()" },
		{ txt = "  Recent Files", keys = "fr", cmd = "lua Snacks.picker.recent()" },
		{ txt = "󰈭  Find Word", keys = "fg", cmd = "lua Snacks.picker.grep()" },
		{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

		{
			txt = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime) .. " ms"
				return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
			end,
			hl = "NvDashFooter",
			no_gap = true,
			content = "fit",
		},

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	},
}

return M
