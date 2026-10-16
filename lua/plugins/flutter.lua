return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart", "yaml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      -- Neovim started from a GUI/session may not inherit the shell's PATH.
      -- Prefer PATH, then use common SDK locations as a safe fallback.
      local candidates = {
        vim.fn.exepath "flutter",
        vim.fn.expand "$HOME/flutter/bin/flutter",
        vim.fn.expand "$HOME/.config/flutter/bin/flutter",
      }

      local flutter_path
      for _, candidate in ipairs(candidates) do
        if candidate ~= "" and vim.fn.executable(candidate) == 1 then
          flutter_path = vim.fn.resolve(candidate)
          break
        end
      end

      if flutter_path then
        local flutter_bin = vim.fn.fnamemodify(flutter_path, ":h")
        local path_entries = vim.split(vim.env.PATH or "", ":", { trimempty = true })

        if not vim.tbl_contains(path_entries, flutter_bin) then
          table.insert(path_entries, 1, flutter_bin)
          vim.env.PATH = table.concat(path_entries, ":")
        end
      end

      local lsp = { debug = 2 }
      if flutter_path then
        local flutter_sdk = vim.fn.fnamemodify(flutter_path, ":h:h")
        local dart_candidates = {
          flutter_sdk .. "/bin/cache/dart-sdk/bin/dart",
          flutter_sdk .. "/bin/dart",
        }

        for _, candidate in ipairs(dart_candidates) do
          if vim.fn.executable(candidate) == 1 then
            -- Avoid the Flutter wrapper for dartls: it may update Flutter's
            -- engine stamp before starting the analysis server.
            lsp.cmd = { vim.fn.resolve(candidate), "language-server", "--protocol=lsp" }
            break
          end
        end
      end

      require("flutter-tools").setup {
        -- Passing the absolute binary path avoids relying on the environment
        -- inherited by Neovim and also lets flutter-tools locate dartls.
        flutter_path = flutter_path,
        lsp = lsp,
      }
    end,
  },
}
