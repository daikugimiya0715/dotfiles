-- nvim-treesitter (main ブランチ) の設定
--
-- main ブランチはパーサー/クエリの提供に専念しており、ハイライト自体は Neovim 本体の
-- treesitter が担当する。master 時代と違って自動では有効にならないので、
--   1. 必要なパーサーを install する
--   2. FileType で vim.treesitter.start() を呼ぶ
-- の 2 つを明示的に行う。

local languages = {
	"vim",
	"lua",
	"vimdoc",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"terraform",
	"hcl",
	"bash",
	"python",
	"rust",
	"go",
	"gomod",
	"gosum",
	"typescript",
	"javascript",
	"tsx",
	"json",
	"yaml",
	"toml",
	"dockerfile",
	"prisma",
}

require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

-- install() は非同期かつ導入済みなら no-op だが、毎回の起動で全言語を舐めないよう差分だけ渡す
local installed = require("nvim-treesitter.config").get_installed("parsers")
local missing = vim.tbl_filter(function(lang)
	return not vim.tbl_contains(installed, lang)
end, languages)

if #missing > 0 then
	require("nvim-treesitter").install(missing)
end

-- パーサーが入っている filetype だけ treesitter ハイライトに切り替える。
-- 未導入の言語では start() が失敗するので、その場合は Vim 標準の syntax がそのまま残る。
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true }),
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
