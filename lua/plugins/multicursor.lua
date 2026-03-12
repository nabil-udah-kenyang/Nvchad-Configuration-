return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-j>",
        ["Find Subword Under"] = "<C-j>",
      }
    end,
  },
}
