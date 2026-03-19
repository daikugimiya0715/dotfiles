-- Navigation & Search plugins: snacks, flash, hbac, nvim-tree
return {
	-- Snacks.nvim: Modern utilities (picker, lazygit, bufdelete, terminal)
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = false },
			quickfile = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = true },
			bufdelete = { enabled = true },
			terminal = { enabled = true, win = { style = "terminal" } },
			lazygit = {
				enabled = true,
				configure = true,
				config = {
					os = { editPreset = "nvim-remote" },
					gui = { nerdFontsVersion = "3" },
				},
				theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
				theme = {
					[241] = { fg = "Special" },
					activeBorderColor = { fg = "MatchParen", bold = true },
					defaultFgColor = { fg = "Normal" },
					inactiveBorderColor = { fg = "FloatBorder" },
					selectedLineBgColor = { bg = "Visual" },
					unstagedChangesColor = { fg = "DiagnosticError" },
				},
				win = { style = "lazygit" },
			},
			picker = {
				enabled = true,
				sources = {
					files = { hidden = true, ignored = false },
					grep = { hidden = true },
					buffers = { current = false },
				},
				win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
			},
		},
		keys = {
			{
				"<leader><leader>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Picker",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit.open()
				end,
				desc = "LazyGit",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "LazyGit Log",
			},
			{
				"<leader>gf",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "LazyGit File Log",
			},
			{
				"<leader>Q",
				function()
					Snacks.terminal("lazydocker", { win = { style = "lazygit" } })
				end,
				desc = "LazyDocker",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bo",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete Other Buffers",
			},
			-- Find (Snacks picker)
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Grep Word",
				mode = { "n", "x" },
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent Files",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>fk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>fR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume Last Picker",
			},
			{
				"<C-p>",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			-- Terminal (tmux)
			{
				"<leader>tt",
				function()
					local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					local session_name = cwd:gsub("%.", "-")
					Snacks.terminal("tmux new-session -A -s " .. session_name, {
						win = { position = "float", border = "rounded", backdrop = 80 },
					})
				end,
				desc = "Toggle Terminal (tmux)",
			},
			{
				"<leader>tq",
				function()
					local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					local session_name = cwd:gsub("%.", "-")
					Snacks.terminal("tmux kill-session -t " .. session_name, {
						win = { position = "float", border = "rounded", backdrop = 80 },
					})
				end,
				desc = "Kill tmux session",
			},
			{
				"<leader>th",
				function()
					Snacks.terminal(nil, { win = { position = "bottom", height = 0.3 } })
				end,
				desc = "Terminal (horizontal)",
			},
			{
				"<leader>tv",
				function()
					Snacks.terminal(nil, { win = { position = "right", width = 0.4 } })
				end,
				desc = "Terminal (vertical)",
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					vim.print = _G.dd
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.inlay_hints():map("<leader>uh")
				end,
			})
		end,
	},

	-- hbac.nvim: Auto close unused buffers
	{
		"axkirillov/hbac.nvim",
		event = "VeryLazy",
		opts = { autoclose = true, threshold = 10, close_buffers_with_windows = false },
	},

	-- flash.nvim: Fast navigation
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
		opts = {
			labels = "asdfghjklqwertyuiopzxcvbnm",
			search = { multi_window = true },
			label = { rainbow = { enabled = true, shade = 5 } },
			modes = { char = { jump_labels = true } },
		},
	},

	-- nvim-tree: File explorer with buffer highlight
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
			{ "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Find File in Tree" },
		},
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					update_root = false,
				},
				view = {
					width = 30,
					side = "left",
					cursorline = true,
				},
				renderer = {
					highlight_git = "name",
					special_files = {},
					icons = {
						web_devicons = {
							file = { color = false },
							folder = { color = false },
						},
						show = {
							git = true,
						},
					},
				},
				git = {
					enable = true,
				},
				filters = {
					git_ignored = false,
				},
			})

			-- 実行可能ファイルの色付けを無効化（通常テキスト色にする）
			vim.api.nvim_set_hl(0, "NvimTreeExecFile", {})

			-- Auto-sync tree cursor to current buffer on BufEnter
			local api = require("nvim-tree.api")
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					local bufname = vim.fn.bufname()
					-- Skip if entering the tree itself or non-file buffers
					if bufname:match("NvimTree_") or vim.bo.buftype ~= "" then
						return
					end
					-- Only find_file if the tree is already visible
					if api.tree.is_visible() then
						api.tree.find_file({ buf = vim.fn.bufnr(), open = false, focus = false })
					end
				end,
			})
		end,
	},

	-- overlook.nvim: Code peek in floating popups
	{
		"WilliamHsieh/overlook.nvim",
		event = "LspAttach",
		keys = {
			{
				"<leader>pd",
				function()
					require("overlook").open_definition()
				end,
				desc = "Peek Definition",
			},
			{
				"<leader>pc",
				function()
					require("overlook").close_all()
				end,
				desc = "Close All Popups",
			},
			{
				"<leader>pu",
				function()
					require("overlook").restore_one()
				end,
				desc = "Restore Last Popup",
			},
			{
				"<leader>pU",
				function()
					require("overlook").restore_all()
				end,
				desc = "Restore All Popups",
			},
			{
				"<leader>pf",
				function()
					require("overlook").toggle_focus()
				end,
				desc = "Toggle Focus",
			},
			{
				"<leader>ps",
				function()
					require("overlook").open_in_split()
				end,
				desc = "Open in Split",
			},
			{
				"<leader>pv",
				function()
					require("overlook").open_in_vsplit()
				end,
				desc = "Open in VSplit",
			},
			{
				"<leader>po",
				function()
					require("overlook").open_in_original()
				end,
				desc = "Open in Original",
			},
		},
		opts = {
			border = "rounded",
			max_width = 100,
			max_height = 20,
		},
	},
}
