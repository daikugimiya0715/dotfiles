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
			require("configs.conform")
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

	-- mason-lspconfig.nvim: Mason と LSP の橋渡し
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {},
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

	-- nvim-treesitter: クエリファイル（highlights.scm等）の提供元
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
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
		},
	},
}
