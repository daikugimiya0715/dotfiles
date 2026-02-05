require("nvchad.mappings")

local map = vim.keymap.set
local del = vim.keymap.del

-- ═══════════════════════════════════════════════════════════════════════════
-- NvChad Default Overrides (衝突するデフォルトキーを無効化)
-- ═══════════════════════════════════════════════════════════════════════════

-- Terminal: Snacks terminal を使うため nvterm 無効化
pcall(del, "n", "<leader>h")
pcall(del, "n", "<leader>v")
pcall(del, { "n", "t" }, "<A-v>")
pcall(del, { "n", "t" }, "<A-h>")
pcall(del, { "n", "t" }, "<A-i>")

-- Buffer/Diagnostics: prefix group として使うため即発火を無効化
pcall(del, "n", "<leader>b")
pcall(del, "n", "<leader>x")

-- Search: NvChad の Telescope を Snacks picker で上書き (del だと Snacks 側も消えるため map で再登録)
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map({ "n", "x" }, "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "Grep Word" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Pages" })
pcall(del, "n", "<leader>fo")
pcall(del, "n", "<leader>fz")
pcall(del, "n", "<leader>fa")
pcall(del, "n", "<leader>cm")

-- Git: diffview と衝突
pcall(del, "n", "<leader>gt")

-- Theme: NvChad の theme picker を Snacks terminal horizontal で上書き
map("n", "<leader>th", function() Snacks.terminal(nil, { win = { position = "bottom", height = 0.3 } }) end, { desc = "Terminal (horizontal)" })

-- Toggle: 個別に管理
pcall(del, "n", "<leader>n")
pcall(del, "n", "<leader>rn")

-- File explorer: NvChad デフォルトを NvimTree で上書き
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })

-- Format: <leader>cf に統一
pcall(del, "n", "<leader>fm")

-- Diagnostics loclist: <leader>lq にある
pcall(del, "n", "<leader>ds")

-- Pick term: 不使用
pcall(del, "n", "<leader>pt")

-- ═══════════════════════════════════════════════════════════════════════════
-- Basic Operations
-- ═══════════════════════════════════════════════════════════════════════════

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Navigation
-- ═══════════════════════════════════════════════════════════════════════════

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Visual Mode Improvements
-- ═══════════════════════════════════════════════════════════════════════════

-- Move selected lines
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })

-- Better paste (don't overwrite register)
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwrite" })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

-- ═══════════════════════════════════════════════════════════════════════════
-- LSP Keymaps (enhanced)
-- ═══════════════════════════════════════════════════════════════════════════

map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>lk", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<leader>lD", vim.lsp.buf.type_definition, { desc = "Type definition" })
map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<leader>lwl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ═══════════════════════════════════════════════════════════════════════════

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Terminal
-- ═══════════════════════════════════════════════════════════════════════════

-- Helper: floatingウィンドウではキーをそのまま渡し、それ以外ではウィンドウ移動
local function term_nav(key, dir)
	return function()
		local win = vim.api.nvim_get_current_win()
		local is_floating = vim.api.nvim_win_get_config(win).relative ~= ""
		if is_floating then
			-- floatingターミナルではキーをそのままターミナルに送る
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), "n", false)
		else
			-- 通常のターミナルではウィンドウ移動
			vim.cmd("wincmd " .. dir)
		end
	end
end

map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", term_nav("<C-h>", "h"), { desc = "Go to left window (non-floating)" })
map("t", "<C-j>", term_nav("<C-j>", "j"), { desc = "Go to lower window (non-floating)" })
map("t", "<C-k>", term_nav("<C-k>", "k"), { desc = "Go to upper window (non-floating)" })
map("t", "<C-l>", term_nav("<C-l>", "l"), { desc = "Go to right window (non-floating)" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Quick Actions
-- ═══════════════════════════════════════════════════════════════════════════

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Quick fix list navigation
map("n", "<leader>j", "<cmd>cnext<cr>zz", { desc = "Next quickfix" })
map("n", "<leader>k", "<cmd>cprev<cr>zz", { desc = "Prev quickfix" })

-- Search and replace word under cursor
map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Make file executable
map("n", "<leader>cx", "<cmd>!chmod +x %<cr>", { silent = true, desc = "Make file executable" })

-- ═══════════════════════════════════════════════════════════════════════════
-- Splits
-- ═══════════════════════════════════════════════════════════════════════════

map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>w=", "<C-w>=", { desc = "Equal split sizes" })
map("n", "<leader>wm", "<cmd>only<cr>", { desc = "Maximize window" })
