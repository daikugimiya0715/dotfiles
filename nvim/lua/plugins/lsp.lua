-- LSP, Formatting & Treesitter plugins
return {
	-- conform.nvim: Formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				desc = "Format Buffer",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					typescript = { "prettier", "deno_fmt" },
					javascript = { "prettier" },
					typescriptreact = { "prettier" },
					javascriptreact = { "prettier" },
					lua = { "stylua" },
					terraform = { "terraform_fmt" },
					bash = { "shfmt" },
					sh = { "shfmt" },
					python = { "black", "isort" },
					rust = { "rustfmt", lsp_format = "fallback" },
					go = { "gofmt", "goimports", "gofumpt" },
					yaml = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
			})
		end,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	-- mason.nvim: LSP/DAP/Linter installer
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
				"typescript-language-server",
				"deno",
				"emmet-ls",
				"json-lsp",
				"shfmt",
				"shellcheck",
				"goimports",
				"gopls",
				"gofumpt",
				"terraform-ls",
				"black",
				"isort",
				"rust-analyzer",
				"codelldb",
				"delve",
				"yaml-language-server",
				"bash-language-server",
				"pyright",
				"ruff",
				"biome",
				"eslint-lsp",
				"marksman",
			},
		},
	},

	-- schemastore.nvim: JSON schemas
	{ "b0o/schemastore.nvim", lazy = true },

	-- lspsaga.nvim: Enhanced LSP UI (hover, code_action, rename, diagnostic)
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			hover = {
				max_width = 0.9,
				max_height = 0.8,
				open_link = "gx",
			},
			code_action = {
				show_server_name = true,
				extend_gitsigns = false,
			},
			lightbulb = {
				enable = true,
				sign = true,
				virtual_text = false,
			},
			rename = {
				in_select = true,
				auto_save = false,
			},
			diagnostic = {
				show_code_action = true,
				jump_num_shortcut = true,
			},
			finder = { enable = false },
			definition = { enable = false },
			outline = { enable = false },
			callhierarchy = { enable = false },
			implement = { enable = false },
			ui = {
				border = "rounded",
				title = true,
				winblend = 0,
			},
			symbol_in_winbar = {
				enable = false,
			},
		},
	},

	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
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
				},
			})
		end,
	},
}
