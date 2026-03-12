return {
  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require "statuscol.builtin"

      require("statuscol").setup {
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { " " } },
          { text = { builtin.lnumfunc } },
        },
      }

      vim.opt.foldcolumn = "1"
      vim.opt.fillchars = {
        foldopen = "v",
        foldclose = ">",
        fold = " ",
      }
    end,
  },
}
