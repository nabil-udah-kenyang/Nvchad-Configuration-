return {
  {
    "rmagatti/auto-session",
    lazy = false,

    opts = {
      enabled = true,
      auto_save = true,
      auto_restore = true,
      auto_restore_last_session = false,

      root_dir = vim.fn.stdpath "data" .. "/sessions/",
      suppressed_dirs = {
        vim.fn.expand "~",
        vim.fn.expand "~/Downloads",
        "/",
      },

      -- Keep all buffers in the session, but avoid restoring transient UI
      -- buffers as if they were project files.
      close_filetypes_on_save = { "checkhealth" },
      continue_restore_on_error = true,
      show_auto_restore_notif = false,

      session_lens = {
        load_on_setup = true,
        previewer = false,
        picker_opts = { border = true },
      },

      post_restore_cmds = {
        function()
          vim.cmd "silent! bufdo e"
        end,
      },
    },
  },
}
