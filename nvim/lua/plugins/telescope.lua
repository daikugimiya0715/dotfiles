-- ファジーファインダー
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "ファイル検索" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "テキスト検索" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "バッファ検索" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "ヘルプ検索" },
  },
  config = function()
    require("telescope").setup({})
  end,
}
