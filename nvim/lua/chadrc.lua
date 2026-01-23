---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    WinSeparator = { fg = "#808080", bg = "NONE" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
  },
  tabufline = {
    enabled = true,
  },
}

return M
