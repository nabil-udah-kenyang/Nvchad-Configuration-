return {
  {
    "3rd/image.nvim",
    build = false,
    lazy = false,
    opts = {
      backend = "kitty",
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
