local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },

		-- JavaScript/TypeScript: biome first, then prettier/eslint as fallback
		javascript = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		json = { "biome", "prettier", stop_after_first = true },

		-- Go
		go = { "gofumpt", "goimports" },

		-- Python
		python = { "ruff_format", "ruff_fix" },

		-- Rust
		rust = { "rustfmt" },

		-- Terraform
		terraform = { "terraform_fmt" },

		-- Shell
		bash = { "shfmt" },
		sh = { "shfmt" },

		-- Web
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 2000,
		lsp_fallback = true,
	},
})
