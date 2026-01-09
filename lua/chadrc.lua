-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

vim.filetype.add {
  extension = {
    xvr = "xvr",
  },
}

require "configs.luasnip"

vim.filetype.add {
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}

vim.opt.shell = "/usr/bin/fish"

M.base46 = {
  theme = "everblush",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "┌───────────────────────────────┐",
    "│  󰱪 DO NOT TOUCH MY NEOVIM 󰱪   │",
    "│                               │",
    "│       THIS CONFIG TOOK        │",
    "│    MORE TIME THAN MY LIFE     │",
    "│                               │",
    "│       CTRL+C = PROBLEM    󰯆   │",
    "│     CTRL+V = SKILL ISSUE     │",
    "└───────────────────────────────┘",
    "",
    "",
  },
}
M.ui = {
  tabufline = {
    enabled = true,
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  cmp = {
    style = "atom",
  },
}

return M
