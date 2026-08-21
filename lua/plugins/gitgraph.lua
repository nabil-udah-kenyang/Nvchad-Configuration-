return {
  "isakbm/gitgraph.nvim",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      opts = {
        keymaps = {
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>gl",
      function()
        -- Delete any existing GitGraph buffer first to prevent E95 buffer name error
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            local ft = vim.bo[buf].filetype
            if ft == "gitgraph" or name:match("GitGraph") then
              pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end
          end
        end

        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Git Graph Tree View",
    },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
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
      vim.api.nvim_set_hl(0, "GitGraphBranchMsg", { fg = "#e5c76b", bold = true }) -- Bright Yellow

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

    -- Enable 'q' and '<Esc>' keymaps to close GitGraph buffer instantly
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "gitgraph",
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", opts)
        vim.keymap.set("n", "<Esc>", "<cmd>bdelete!<cr>", opts)
      end,
    })
  end,
}
