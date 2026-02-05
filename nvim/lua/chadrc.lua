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

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "lua Snacks.picker.files()" },
    { txt = "  Recent Files", keys = "fr", cmd = "lua Snacks.picker.recent()" },
    { txt = "󰈭  Find Word", keys = "fg", cmd = "lua Snacks.picker.grep()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
