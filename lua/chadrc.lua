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
vim.opt.wrap = false

M.base46 = {
  theme = "everblush",
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "    ██╗    ██╗   ██╗███████╗███████╗ ",
    "    ██║    ██║   ██║██╔════╝██╔════╝ ",
    "    ██║    ██║   ██║███████╗█████╗   ",
    "    ██║    ██║   ██║╚════██║██╔══╝   ",
    "    ██║    ╚██████╔╝███████║███████╗ ",
    "    ╚═╝     ╚═════╝ ╚══════╝╚══════╝ ",
    "",
    "",

    "    ███╗   ██╗ ██╗   ██╗██╗███╗   ███╗    ██████╗ ████████╗██╗    ██╗",
    "    ████╗  ██║ ██║   ██║██║████╗ ████║    ██╔══██╗╚══██╔══╝██║    ██║",
    "    ██╔██╗ ██║ ██║   ██║██║██╔████╔██║    ██████╔╝   ██║   ██║ █╗ ██║",
    "    ██║╚██╗██║ ╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║   ██║███╗██║",
    "    ██║ ╚████║  ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝   ██║   ╚███╔███╔╝",
    "    ╚═╝  ╚═══╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ ",
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

vim.schedule(function()
  vim.api.nvim_set_hl(0, "Comment", { fg = "#6A9955", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#6A9955", italic = true })
end)

vim.schedule(function()
  -- file aktif yang sedang dibuka
  vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", {
    fg = "#ffffff",
    bg = "#5e81ac",
    bold = false,
  })

  -- baris cursor di nvimtree
  vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
    bg = "#026f92",
    bold = true,
  })
end)
return M
