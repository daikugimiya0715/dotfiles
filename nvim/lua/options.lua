require("nvchad.options")

local o = vim.o

-- Line numbers
o.relativenumber = true
o.number = true
o.numberwidth = 4

-- Scrolling
o.scrolloff = 8
o.sidescrolloff = 8

-- Indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Clipboard
o.clipboard = "unnamedplus"

-- Undo
o.undofile = true
o.undolevels = 10000

-- Misc
o.swapfile = false
o.backup = false
o.termguicolors = true
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.timeoutlen = 300

-- Mouse
o.mouse = "a" -- Enable mouse in all modes
o.mousemoveevent = true -- Enable mouse move events (for hover etc.)

-- Transparent background (for Ghostty)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#808080", bg = "NONE" })
	end,
})

-- Terminal settings: wrap lines to prevent horizontal scrolling
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.sidescrolloff = 0
	end,
})
