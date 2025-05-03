local utils = require "utils"

return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = utils.safe_keymap_set },
    words = { enabled = true },

    dashboard = {
      preset = {
        enabled = true,
        icon = "",
        text = "Snacks",
        color = "#ff9e64",
      }
    }
  },
}