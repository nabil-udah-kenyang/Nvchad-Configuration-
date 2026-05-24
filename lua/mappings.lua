require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-t>", function()
  require("minty.shades").open { border = false }
end, {})

vim.keymap.set("n", "<C-p>", ":FloatermToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>mt", ":Markview toggle<CR>", { silent = true }, { desc = "markdown preview" })

vim.keymap.set("n", "<C-l>", function()
  require("triforce").show_profile()
end, { desc = "tampilkan triforce statsnya" })

vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

map({ "n", "i", "v" }, "<C-s>", function()
  if vim.fn.mode() == "i" then
    vim.cmd "stopinsert"
  end

  if vim.bo.filetype == "dart" then
    pcall(function()
      vim.lsp.buf.format { async = false }
    end)

    vim.cmd "silent! w"
    pcall(vim.cmd, "FlutterReload")
  else
    vim.cmd "silent! w"
  end
end, { desc = "Save / Dart format reload" })

-- trouble mappings
vim.keymap.set(
  "n",
  "<leader>td",
  "<cmd>Trouble diagnostics  filter.buf = 0 win.type = split win.position=right<CR>",
  { desc = "Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>tl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list (Trouble)" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all text" })
