local utils = require "utils"

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        enabled = true,
        icon = "",
        text = "Snacks",
        color = "#ff9e64",
      }
    },
    explorer = {
      enabled = true,
      layout = {
        cycle = false,
      },
    },
    image = { enabled = true }
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
      enabled = true,
      layout = {
        preset = "telescope",
        cycle = false,
      },
      matchers = {
        frecency = true,
        cwd_bonus = false,
      },
    },
    quickfile = {
      enabled = true,
      exclude = { "latex" },
    },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = utils.safe_keymap_set },
    words = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
    { "<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer" },
    { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
    { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete or Close Buffer  (Confirm)" },

    -- Snacks Picker
    { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)" },
    { "<leader>pc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep word" },
    { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = { "n", "x" } },
    { "<leader>pk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Search Keymaps (Snacks Picker)" },

    -- Git Stuff
    { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch Git Branches" },

    -- Other
    { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages" },
  }
}
