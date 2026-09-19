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
		opts = {},
	},

	-- mason-tool-installer.nvim: mason パッケージの自動インストール
	-- NOTE: mason.nvim 本体に `ensure_installed` オプションは存在しない（書いても黙って無視される）。
	-- 実際にインストールを走らせるにはこのプラグインが必要。LSP/フォーマッタ/リンタ/DAP をまとめて宣言する。
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = "VeryLazy",
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
			run_on_start = true,
			auto_update = false,
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

	-- nvim-treesitter: パーサーとクエリファイル（highlights.scm等）の提供元
	-- NOTE: main ブランチは master とは非互換な全面書き直しで、`opts.ensure_installed` や
	-- `highlight.enable` は無視される。パーサーの導入とハイライト有効化は configs/treesitter で明示する。
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- main ブランチは lazy-loading 非対応
		build = ":TSUpdate",
		config = function()
			require("configs.treesitter")
		end,
	},
}
