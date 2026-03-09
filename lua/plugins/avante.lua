return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {
      provider = "gemini",
      auto_suggestions_provider = "gemini",

      providers = {
        gemini = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
          model = "gemini-1.5-flash",
          timeout = 30000,
          api_key_name = "GEMINI_API_KEY",
        },
      },
    },
  },
}
