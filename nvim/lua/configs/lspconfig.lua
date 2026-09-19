-- Neovim 0.11+ native LSP configuration

-- Enable LSP servers
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"eslint",
	"gopls",
	"pyright",
	"marksman",
	"terraformls",
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

-- ESLint
-- nvim-lspconfig デフォルトの root は lock ファイル/.git 基準のため、モノレポでは
-- root がリポジトリルートになり、ルートに hoist された古い eslint（eslintrc モード）が
-- 解決されて「Parsing error: The keyword 'import' is reserved」の偽エラーになる。
-- root を「eslint config のあるディレクトリ」基準に変え、各パッケージの eslint と
-- flat config が解決されるようにする。config が見つからないバッファには
-- workspace_required = true（デフォルト継承）により attach しない。
vim.lsp.config("eslint", {
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, {
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			"eslint.config.js",
			"eslint.config.mjs",
			"eslint.config.cjs",
			"eslint.config.ts",
			"eslint.config.mts",
			"eslint.config.cts",
		})
		if root then
			on_dir(root)
		end
	end,
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

-- Terraform
-- nvim-lspconfig デフォルトの root_markers は { ".terraform", ".git" }。terraform_for_aws のような
-- 数百の root module を含む monorepo では root がリポジトリルートになり、terraform-ls が
-- 全体を走査して実用にならない。root を「*.tf があるディレクトリ」＝ terraform の root module 単位に変える。
vim.lsp.config("terraformls", {
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, function(name)
			return name:match("%.tf$") ~= nil
		end)
		if root then
			on_dir(root)
		end
	end,
	-- terraform-ls は settings ではなく init_options で設定を受け取る。
	-- validateOnSave は terraform init 済みでないとエラーだらけになるため有効にしない。
	init_options = {
		experimentalFeatures = {
			prefillRequiredFields = true,
		},
	},
})

-- Python
-- pyright は venvPath/pythonPath 未設定だと PATH 上の python を見るため、
-- direnv を通さずに nvim を起動するとプロジェクトの .venv を解決できない。
-- root_dir 配下の .venv を探して pythonPath として渡す。
local function resolve_python_path(root_dir)
	if root_dir then
		local venv_python = root_dir .. "/.venv/bin/python"
		if vim.uv.fs_stat(venv_python) then
			return venv_python
		end
	end
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV .. "/bin/python"
	end
	local system_python = vim.fn.exepath("python3")
	return system_python ~= "" and system_python or "python"
end

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
	-- NOTE: client.settings は Client.create 時に config.settings の参照を保持するため、
	-- before_init で新しいテーブルを代入しても反映されない。必ず in-place で書き換える。
	before_init = function(_, config)
		config.settings = config.settings or {}
		config.settings.python = config.settings.python or {}
		config.settings.python.pythonPath = resolve_python_path(config.root_dir)
	end,
})
