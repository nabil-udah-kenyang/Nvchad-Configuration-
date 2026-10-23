return {
  {
    "nabil-udah-kenyang/codex-panel.nvim",
    dependencies = { "stevearc/dressing.nvim" },
    cmd = { "CodexPanel" },
    keys = {
      { "<leader>co", "<cmd>CodexPanel<cr>", desc = "Codex: Open or toggle panel" },
      {
        "<leader>cc",
        function()
          require("codex-panel").close()
        end,
        desc = "Codex: Close panel",
      },
      { "<leader>ac", "<cmd>CodexPanel<cr>", desc = "Codex: Toggle panel (legacy)" },
      { "<leader>acm", "<cmd>CodexPanel model<cr>", desc = "Codex: Choose model" },
      { "<leader>acr", "<cmd>CodexPanel reasoning<cr>", desc = "Codex: Choose reasoning effort" },
    },
    config = function()
      require("codex-panel").setup()
    end,
  },
}
