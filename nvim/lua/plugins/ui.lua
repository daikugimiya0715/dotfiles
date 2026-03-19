-- UI plugins: statusline, modes, notifications, dimming
return {
	-- incline.nvim: Floating statusline for current file info
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local devicons = require("nvim-web-devicons")

			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0, vertical = 0 },
					placement = { horizontal = "right", vertical = "bottom" },
				},
				hide = { cursorline = false, focused_win = false, only_win = false },
				render = function(props)
					local full_path = vim.api.nvim_buf_get_name(props.buf)
					local filename = vim.fn.fnamemodify(full_path, ":t")
					if filename == "" then
						filename = "[No Name]"
					end

					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified

					-- Show project-root-relative path
					local display_name = vim.fn.fnamemodify(full_path, ":.")
					if display_name == "" or display_name == full_path then
						display_name = filename
					end

					-- Diagnostics
					local diagnostics = {}
					local diag_counts = {
						error = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity.ERROR }),
						warn = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity.WARN }),
					}

					local has_diagnostics = diag_counts.error > 0 or diag_counts.warn > 0
					local text_hl = has_diagnostics
							and (diag_counts.error > 0 and "DiagnosticError" or "DiagnosticWarn")
						or (props.focused and "Normal" or "Comment")

					if diag_counts.error > 0 then
						table.insert(diagnostics, { "  ", guifg = "#ff6c6b" })
						table.insert(diagnostics, { tostring(diag_counts.error), guifg = "#ff6c6b" })
					end
					if diag_counts.warn > 0 then
						table.insert(diagnostics, { "  ", guifg = "#ECBE7B" })
						table.insert(diagnostics, { tostring(diag_counts.warn), guifg = "#ECBE7B" })
					end

					local res = { guibg = props.focused and "#1e1e2e" or "#11111b", { " " } }

					if ft_icon then
						table.insert(res, { ft_icon, guifg = ft_color })
						table.insert(res, { " " })
					end

					table.insert(res, { display_name, gui = modified and "bold,italic" or "bold", group = text_hl })

					if modified then
						table.insert(res, { " ", guifg = "#fab387" })
					end

					for _, diag in ipairs(diagnostics) do
						table.insert(res, diag)
					end

					table.insert(res, { " " })
					return res
				end,
			})
		end,
	},

	-- modes.nvim: Show mode via cursorline color
	{
		"mvllow/modes.nvim",
		event = "VeryLazy",
		config = function()
			require("modes").setup({
				colors = {
					bg = "",
					copy = "#f5c359",
					delete = "#c75c6a",
					insert = "#78ccc5",
					visual = "#9745be",
				},
				line_opacity = 0.25,
				set_cursor = true,
				set_cursorline = true,
				set_number = true,
				ignore_filetypes = { "NvimTree", "TelescopePrompt", "oil", "lazy", "nvdash" },
			})
		end,
	},

	-- noice.nvim: Floating cmdline, messages, notifications
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
					format = {
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
						lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
						help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
					},
				},
				messages = { enabled = true, view = "notify", view_error = "notify", view_warn = "notify" },
				popupmenu = { enabled = true, backend = "nui" },
				lsp = {
					progress = { enabled = true },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = { enabled = false },
					signature = { enabled = false },
				},
				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = true,
				},
				views = {
					cmdline_popup = {
						position = { row = "50%", col = "50%" },
						size = { width = 60, height = "auto" },
						border = { style = "rounded", padding = { 0, 1 } },
					},
				},
			})
		end,
	},

	-- nvim-notify: Better notification UI
	{
		"rcarriga/nvim-notify",
		lazy = true,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				fps = 60,
				render = "compact",
				stages = "fade",
				timeout = 3000,
				top_down = false,
			})
		end,
	},

	-- Vimade: Dim inactive buffers
	{
		"TaDaa/vimade",
		event = "VeryLazy",
		config = function()
			require("vimade").setup({
				fadelevel = 0.5,
				basebg = "#11111b",
				blocklist = { default = { buf_opts = { buftype = { "terminal" } } } },
			})
		end,
	},

	-- better-escape.nvim: jk/jj to escape
	{
		"max397574/better-escape.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			timeout = vim.o.timeoutlen,
			default_mappings = false,
			mappings = {
				i = { j = { k = "<Esc>", j = "<Esc>" } },
				c = { j = { k = "<Esc>", j = "<Esc>" } },
				v = { j = { k = "<Esc>" } },
				s = { j = { k = "<Esc>" } },
			},
		},
	},

	-- which-key.nvim: Key binding hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			delay = 300,
			icons = { mappings = true, keys = {} },
			spec = {
				{ "<leader>a", group = "AI", icon = "" },
				{ "<leader>b", group = "Buffer", icon = "" },
				{ "<leader>c", group = "Code", icon = "" },
				{ "<leader>f", group = "Find", icon = "" },
				{ "<leader>g", group = "Git", icon = "" },
				{ "<leader>l", group = "LSP", icon = "" },
				{ "<leader>p", group = "Peek", icon = "" },
				{ "<leader>d", group = "Debug (DAP)", icon = "" },
				{ "<leader>r", group = "Rename/Replace/Rust", icon = "" },
				{ "<leader>t", group = "Terminal", icon = "" },
				{ "<leader>u", group = "Toggle", icon = "" },
				{ "<leader>w", group = "Window", icon = "" },
				{ "<leader>x", group = "Diagnostics", icon = "" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps",
			},
		},
	},

	-- indent-blankline.nvim: Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},

	-- nvim-scrollbar: Scrollbar with diagnostics/search markers
	{
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",
		config = function()
			require("scrollbar").setup({
				handle = {
					color = "#585b70",
				},
				marks = {
					Error = { color = "#f38ba8" },
					Warn = { color = "#f9e2af" },
					Info = { color = "#89dceb" },
					Hint = { color = "#a6e3a1" },
					Search = { color = "#f9e2af" },
				},
				handlers = {
					diagnostic = true,
					search = true,
					gitsigns = true,
				},
			})
		end,
	},
}
