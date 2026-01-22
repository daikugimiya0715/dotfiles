-- リーダーキーをスペースに設定（lazy.nvimより先に設定する必要がある）
vim.g.mapleader = " "

-- Neovimでクリップボードとヤンクを共有
vim.opt.clipboard:append("unnamedplus")

-- lazy.nvimのセットアップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定版
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの設定
require("lazy").setup("plugins")
