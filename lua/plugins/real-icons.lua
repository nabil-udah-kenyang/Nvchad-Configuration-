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
      local real_icons = require "real-icons.integrations.nvim_tree"

      builder.icon_name_decorated = function(self, node)
        local icon, name = default_icon_name_decorated(self, node)
        local is_directory = node and (node.type == "directory" or type(node.nodes) == "table" or node.has_children ~= nil)

        if is_directory then
          local real_icon = real_icons.icon_for_node(node)
          if real_icon then
            icon = real_icon
          end
        end

        return icon, name
      end
    end,
  },
}
