-- Neovim 0.11+ native LSP configuration

-- Enable LSP servers
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"eslint",
	"gopls",
	"pyright",
	"marksman",
})

-- Lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

-- Go
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

-- Python
vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
})
