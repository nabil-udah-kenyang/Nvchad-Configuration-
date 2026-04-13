return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart", -- 🔥 ini kunci fix nya
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup {}
    end,
  },
}
