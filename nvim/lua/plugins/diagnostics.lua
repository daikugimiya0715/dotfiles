-- Diagnostics & Code Quality plugins
return {
	-- Diagnostics keymaps (using Snacks picker)
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<leader>xx",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics (Workspace)",
			},
			{
				"<leader>xX",
				function()
					Snacks.picker.diagnostics({ filter = { buf = 0 } })
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>xs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>xq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
		},
	},
}
