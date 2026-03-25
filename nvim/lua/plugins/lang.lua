-- Language-specific plugins: Rust, Markdown
return {
	-- crates.nvim: Cargo.toml dependency management
	{
		"saecki/crates.nvim",
		tag = "stable",
		ft = { "toml" },
		config = function()
			require("crates").setup()
		end,
		keys = {
			{
				"<leader>cv",
				function()
					require("crates").show_versions_popup()
				end,
				ft = "toml",
				desc = "Crate versions",
			},
			{
				"<leader>cu",
				function()
					require("crates").update_crate()
				end,
				ft = "toml",
				desc = "Update crate",
			},
			{
				"<leader>cU",
				function()
					require("crates").upgrade_crate()
				end,
				ft = "toml",
				desc = "Upgrade crate",
			},
			{
				"<leader>cA",
				function()
					require("crates").update_all_crates()
				end,
				ft = "toml",
				desc = "Update all crates",
			},
			{
				"<leader>cF",
				function()
					require("crates").show_features_popup()
				end,
				ft = "toml",
				desc = "Crate features",
			},
		},
	},

	-- rustaceanvim: Enhanced Rust support
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							inlayHints = {
								closureCaptureHints = { enable = true },
								lifetimeElisionHints = { enable = "skip_trivial" },
							},
							diagnostics = {
								experimental = { enable = true },
							},
							check = {
								command = "clippy",
								extraArgs = { "--all" },
							},
							hover = {
								actions = { enable = true },
							},
							semanticHighlighting = {
								operator = { specialization = { enable = true } },
								punctuation = { specialization = { enable = true } },
							},
							typing = {
								autoClosingAngleBrackets = { enable = true },
							},
						},
					},
				},
			}
		end,
		keys = {
			{
				"<leader>rt",
				function()
					vim.cmd.RustLsp("testables")
				end,
				ft = "rust",
				desc = "Run tests",
			},
			{
				"<leader>re",
				function()
					vim.cmd.RustLsp("explainError")
				end,
				ft = "rust",
				desc = "Explain error",
			},
			{
				"<leader>rR",
				function()
					vim.cmd.RustLsp("runnables")
				end,
				ft = "rust",
				desc = "Runnables",
			},
			{
				"<leader>rm",
				function()
					vim.cmd.RustLsp("expandMacro")
				end,
				ft = "rust",
				desc = "Expand macro",
			},
			{
				"<leader>rc",
				function()
					vim.cmd.RustLsp("openCargo")
				end,
				ft = "rust",
				desc = "Open Cargo.toml",
			},
			{
				"<leader>rp",
				function()
					vim.cmd.RustLsp("parentModule")
				end,
				ft = "rust",
				desc = "Parent module",
			},
			{
				"<leader>rd",
				function()
					vim.cmd.RustLsp("renderDiagnostic")
				end,
				ft = "rust",
				desc = "Render diagnostic",
			},
			{
				"<leader>rD",
				function()
					vim.cmd.RustLsp("debuggables")
				end,
				ft = "rust",
				desc = "Debuggables",
			},
			{
				"<leader>rs",
				function()
					vim.cmd.RustLsp("ssr")
				end,
				ft = "rust",
				desc = "Structural search replace",
			},
		},
	},

	-- rustowl: Rust ownership & lifetime visualization
	{
		"cordx56/rustowl",
		version = "*",
		build = "cargo binstall rustowl -y",
		lazy = false,
		opts = {
			auto_enable = false,
		},
		config = function(_, opts)
			require("rustowl").setup(opts)

			local timer_id = nil
			local AUTO_DISABLE_MS = 30000

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "rust",
				callback = function(ev)
					vim.keymap.set("n", "K", function()
						local rustowl = require("rustowl")
						vim.cmd("Lspsaga hover_doc")

						if rustowl.is_enabled() then
							rustowl.disable()
							if timer_id then
								vim.fn.timer_stop(timer_id)
								timer_id = nil
							end
						else
							rustowl.enable()
							if timer_id then
								vim.fn.timer_stop(timer_id)
							end
							timer_id = vim.fn.timer_start(AUTO_DISABLE_MS, function()
								rustowl.disable()
								timer_id = nil
							end)
						end
					end, { buffer = ev.buf, desc = "Hover info + RustOwl toggle" })
				end,
			})
		end,
	},

	-- nvim-nio: Async IO library (dependency for nvim-dap-ui)
	{ "nvim-neotest/nvim-nio", lazy = true },

	-- nvim-dap: Debug Adapter Protocol core
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- nvim-dap-virtual-text: Inline variable display during debug
			{
				"theHamsta/nvim-dap-virtual-text",
				dependencies = { "nvim-treesitter/nvim-treesitter" },
				opts = {},
			},
		},
		config = function()
			local dap = require("dap")

			-- Go: Delve adapter
			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug (go.mod)",
					request = "launch",
					program = "./${relativeFileDirname}",
				},
				{
					type = "delve",
					name = "Debug test",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}
		end,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run last",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},

	-- nvim-dap-ui: DAP UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle DAP UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				mode = { "n", "v" },
				desc = "Eval expression",
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- marp.nvim: Markdown presentations
	{
		"nwiizo/marp.nvim",
		ft = "markdown",
		cmd = { "MarpWatch", "MarpStop", "MarpExport", "MarpDebug" },
		config = function()
			require("marp").setup({
				marp_command = "npx @marp-team/marp-cli@latest",
			})
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

	-- img-clip.nvim: Paste images from clipboard
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- autolist.nvim: Auto-continue lists on Enter
	{
		"gaoDean/autolist.nvim",
		ft = { "markdown", "text", "tex", "plaintex" },
		config = function()
			require("autolist").setup()

			local buf = { buffer = true }
			vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>", buf)
			vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", buf)
			vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", buf)
			vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>", buf)
			vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", buf)
			vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", buf)
			vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>", buf)
		end,
	},
}
