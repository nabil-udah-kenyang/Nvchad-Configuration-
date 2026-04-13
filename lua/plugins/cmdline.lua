return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },

      views = {
        cmdline_popup = {
          position = {
            row = 4,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
    },
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
    dependencies = { "hrsh7th/nvim-cmp" },

    config = function()
      local cmp = require "cmp"

      -- 🔹 COMMAND MODE (:)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),

        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = "  " -- icon Neovim
            vim_item.menu = "" -- hapus "Variable"
            return vim_item
          end,
        },

        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })

      -- 🔹 SEARCH MODE (/)
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}
