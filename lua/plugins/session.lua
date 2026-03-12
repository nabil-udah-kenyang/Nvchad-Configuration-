return {
  {
    "rmagatti/auto-session",
    lazy = false,

    opts = {
      auto_session_enable_last_session = false, -- penting
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,

      auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",

      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    },
  },
}
