return {
	-- Override NvChad defaults
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- nvim-tree (file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = {
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
				ignore = false,
			},
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"yaml",
				"toml",
				"markdown",
				"markdown_inline",
				"go",
				"gomod",
				"gosum",
				"python",
				"rust",
				"bash",
				"dockerfile",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},

	-- Mason (LSP/Formatter installer)
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- LSP
				"lua-language-server",
				"typescript-language-server",
				"gopls",
				"pyright",
				"ruff",
				"rust-analyzer",

				-- Formatters/Linters
				"stylua",
				"prettier",
				"biome",
				"eslint_d",
				"gofumpt",
				"goimports",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
			},
		},
	},

	-- Trouble (diagnostics list)
	{
		"folke/trouble.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "󰍵" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 500,
			},
		},
	},

	-- im-select (Japanese input auto-switch)
	{
		"keaising/im-select.nvim",
		lazy = false,
		config = function()
			require("im_select").setup({
				default_im_select = "com.apple.keylayout.ABC",
				default_command = "im-select",
				set_default_events = { "VimEnter", "InsertLeave", "CmdlineLeave" },
				set_previous_events = {},
			})
		end,
	},

	-- Claude Code (WebSocket MCP protocol implementation)
	{
		"coder/claudecode.nvim",
		lazy = false,
		config = function()
			require("claudecode").setup({})
		end,
	},

	-- Lazygit integration
	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.9
		end,
	},

	-- MarkdownPreview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Marp (Markdown Presentation)
	{
		"nwiizo/marp.nvim",
		cmd = { "MarpWatch", "MarpStop", "MarpExport", "MarpDebug" },
		ft = { "markdown" },
		config = function()
			require("marp").setup({
				marp_command = "npx @marp-team/marp-cli@latest",
			})
		end,
	},

	-- Render Markdown (in-editor markdown rendering)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown" },
		opts = {
			checkbox = {
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰄵 " },
			},
		},
	},
}
