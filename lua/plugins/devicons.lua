return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = function(_, opts)
      opts.override_by_filename = {

        artisan = {
          icon = "",
          color = "#FF2D20",
          name = "LaravelArtisan",
        },
      }

      -- untuk extension
      opts.override = {
        css = {
          icon = "",
          color = "#2965F1",
          name = "Css",
        },

        go = {
          icon = "󰟓",
          color = "#00ADD8",
          name = "Go",
        },

        php = {
          icon = "",
          color = "#777BB4",
          name = "Php",
        },
      }

      return opts
    end,
  },
}
