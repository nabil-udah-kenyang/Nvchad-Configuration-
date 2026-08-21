return {
  "isakbm/gitgraph.nvim",
  dependencies = { "sindrets/diffview.nvim" },
  keys = {
    {
      "<leader>gl",
      function()
        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Git Graph Tree View",
    },
  },
  config = function()
    local gitgraph = require("gitgraph")

    gitgraph.setup({
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%Y-%m-%d %H:%M:%S",
        fields = { "hash", "timestamp", "author", "branch_name", "tag", "message" },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.cmd("DiffviewOpen " .. commit.hash .. "^!")
        end,
        on_select_range_commit = function(from, to)
          vim.cmd("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    })

    -- Everblush palette highlights for GitGraph (high contrast & bright)
    local set_hl = function()
      vim.api.nvim_set_hl(0, "GitGraphHash", { fg = "#c47fd5", bold = true }) -- Purple
      vim.api.nvim_set_hl(0, "GitGraphTimestamp", { fg = "#67cbe7" }) -- Cyan
      vim.api.nvim_set_hl(0, "GitGraphAuthor", { fg = "#e5e5e5", bold = true }) -- Putih (White)
      vim.api.nvim_set_hl(0, "GitGraphBranchName", { fg = "#8ccf7e", bold = true }) -- Bright Green
      vim.api.nvim_set_hl(0, "GitGraphBranchTag", { fg = "#e5c76b", bold = true }) -- Yellow
      vim.api.nvim_set_hl(0, "GitGraphBranchMsg", { fg = "#e5c76b", bold = true }) -- Bright Yellow (Kuning Terang!)

      -- Branch tree lines colors
      vim.api.nvim_set_hl(0, "GitGraphBranch1", { fg = "#8ccf7e" })
      vim.api.nvim_set_hl(0, "GitGraphBranch2", { fg = "#67cbe7" })
      vim.api.nvim_set_hl(0, "GitGraphBranch3", { fg = "#c47fd5" })
      vim.api.nvim_set_hl(0, "GitGraphBranch4", { fg = "#e5c76b" })
      vim.api.nvim_set_hl(0, "GitGraphBranch5", { fg = "#e59e67" })
    end

    set_hl()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = set_hl,
    })
  end,
}
