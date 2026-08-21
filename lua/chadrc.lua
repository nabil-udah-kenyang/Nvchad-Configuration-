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

    -- git_blame ada di kanan, tepat sebelum lsp
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "git_blame", "lsp", "cwd", "cursor" },

    modules = {
      -- module git blame: tampil seperti vscode gitlens di statusline
      git_blame = function()
        local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local blame = vim.b[bufnr].gitsigns_blame_line_dict

        if not blame then
          return ""
        end

        -- kalau commit belum ada (uncommitted lines)
        local author = blame.author
        if not author or author == "Not Committed Yet" or author == "" then
          return "%#StGitBlame#  You (not committed yet) %*"
        end

        -- format waktu relatif
        local function time_ago(unix_ts)
          if not unix_ts then return "" end
          local now = os.time()
          local diff = now - unix_ts
          if diff < 60 then
            return diff .. "s ago"
          elseif diff < 3600 then
            return math.floor(diff / 60) .. "m ago"
          elseif diff < 86400 then
            return math.floor(diff / 3600) .. "h ago"
          elseif diff < 2592000 then
            return math.floor(diff / 86400) .. " days ago"
          elseif diff < 31536000 then
            return math.floor(diff / 2592000) .. " months ago"
          else
            return math.floor(diff / 31536000) .. " years ago"
          end
        end

        local author_time = blame.author_time
        local when = time_ago(author_time)

        -- truncate nama author kalau terlalu panjang
        if #author > 20 then
          author = author:sub(1, 18) .. "…"
        end

        -- hanya tampil kalau layar cukup lebar
        if vim.o.columns < 100 then
          return ""
        end

        -- ambil logo branch pakai nr2char biar encoding aman
        local bufnr2 = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local git_status = vim.b[bufnr2].gitsigns_status_dict
        local has_branch = git_status and git_status.head and git_status.head ~= ""

        -- U+E0A0 = powerline branch icon (sama yang dipakai options.lua)
        local icon = vim.fn.nr2char(0xE0A0)
        local branch_icon = has_branch and ("%#StGitBranchIcon#" .. icon .. " %*%#StGitBlame#") or ""

        return "%#StGitBlame#"
          .. " "
          .. branch_icon
          .. author
          .. "  "
          .. when
          .. "  %*"
      end,

    },
  },

  cmp = {
    style = "atom",
  },
}

M.colorify = {
  enabled = false,
  mode = "virtual",
  virt_text = "󱓻 ",
  highlight = {
    hex = true,
    lspvars = true,
  },
}

vim.schedule(function()
  vim.api.nvim_set_hl(0, "Comment", { fg = "#6A9955", italic = true })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#6A9955", italic = true })

  -- highlight groups untuk git blame di statusline (tanpa background, polosan)
  vim.api.nvim_set_hl(0, "StGitBlame",      { fg = "#7a8599", italic = true })
  vim.api.nvim_set_hl(0, "StGitBlameIcon",  { fg = "#e2b86a" })
  vim.api.nvim_set_hl(0, "StGitBranchIcon", { fg = "#69bfce" }) -- icon  warna cyan, mirip VS Code
end)

local function set_nvimtree_highlights()
  -- baris yang sedang disorot cursor di nvim-tree
  vim.api.nvim_set_hl(0, "NvimTreeCursorLine", {
    bg = "#076c75",
    bold = true,
  })

  -- nomor line cursor kalau muncul
  vim.api.nvim_set_hl(0, "NvimTreeCursorLineNr", {
    fg = "#ffffff",
    bg = "#076c75",
    bold = true,
  })

  -- file yang sedang terbuka / aktif
  vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", {
    fg = "#ffffff",
    bg = "#076c75",
    bold = true,
  })

  -- jaga-jaga untuk versi nvim-tree lain
  vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", {
    fg = "#ffffff",
    bg = "#076c75",
    bold = true,
  })
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme", "BufEnter" }, {
  callback = function()
    vim.schedule(set_nvimtree_highlights)
  end,
})
return M
