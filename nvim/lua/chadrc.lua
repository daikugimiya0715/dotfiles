---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
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
