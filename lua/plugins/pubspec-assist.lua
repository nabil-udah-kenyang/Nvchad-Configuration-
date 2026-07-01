return {
  {
    "nabil-udah-kenyang/pubspec-assist.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      require("pubspec-assist").setup()
    end,
  },
}
