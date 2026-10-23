return {
  {
    "3rd/image.nvim",
    build = false,
    lazy = false,
    opts = {
      backend = "kitty",
      -- Normal Kitty placements preserve cropping and avoid virtual
      -- placeholder glyphs in the transcript.
      kitty_method = "normal",
      -- Clear images while floating notifications cover them, then restore
      -- them when the notification window closes.
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = {
        "cmp_menu",
        "cmp_docs",
        "codex_panel_prompt",
        "codex_panel_footer",
        "codex_panel_image_preview",
        "scrollview",
        "scrollview_sign",
      },
      processor = "magick_cli",

      integrations = {
        markdown = {
          enabled = true,
        },
      },

      hijack_file_patterns = {
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.webp",
        "*.avif",
      },
    },
  },
}
