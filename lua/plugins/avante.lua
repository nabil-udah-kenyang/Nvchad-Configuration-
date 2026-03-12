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
      provider = "openrouter",
      auto_suggestions_provider = "openrouter",

      providers = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          model = "google/gemini-flash-1.5",
          api_key_name = "OPENROUTER_API_KEY",
        },
      },
    },
  },
}
