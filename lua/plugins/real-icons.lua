return {
  {
    "Mirsmog/real-icons.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-tree.lua" },
    build = ":RealIconsInstallPack material",
    config = function()
      require("real-icons").setup {
        pack = "material",
        size = {
          cols = 2,
          pixels = 256,
          padding = 2,
          trim = true,
        },
      }

      local builder = require "nvim-tree.renderer.builder"
      local default_icon_name_decorated = builder.icon_name_decorated
      local packs = require "real-icons.packs"
      local renderer = require "real-icons.render.placeholder"
      local resolver = require "real-icons.resolver"

      local function folder_icon(node)
        local icon = resolver.resolve("directory", node.absolute_path, { is_dir = true })

        if node.open then
          local pack = packs.get()
          local folder_name = node.name:lower()
          local open_key = (pack.folder_names_expanded or {})[folder_name] or pack.folder_expanded
          local open_source = open_key and pack.definitions[open_key]

          if open_source then
            icon = vim.tbl_deep_extend("force", {}, icon, {
              key = open_key,
              source = open_source,
              asset = open_source,
              is_default = false,
            })
          end
        end

        local segment = renderer.segment(icon)
        return {
          str = segment.text,
          hl = { segment.hl },
        }
      end

      builder.icon_name_decorated = function(self, node)
        local icon, name = default_icon_name_decorated(self, node)
        local is_directory = node and (node.type == "directory" or type(node.nodes) == "table" or node.has_children ~= nil)

        if is_directory then
          local real_icon = folder_icon(node)
          if real_icon then
            icon = real_icon
          end
        end

        return icon, name
      end
    end,
  },
}
