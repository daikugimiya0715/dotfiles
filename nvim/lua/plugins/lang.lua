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
  },

  -- rustaceanvim: Enhanced Rust support
  { "mrcjkb/rustaceanvim", version = "^5", lazy = false },

  -- marp.nvim: Markdown presentations
  {
    "nwiizo/marp.nvim",
    ft = "markdown",
    cmd = { "MarpWatch", "MarpStop", "MarpExport", "MarpDebug" },
    config = function()
      require("marp").setup {
        marp_command = "npx @marp-team/marp-cli@latest",
      }
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
}
