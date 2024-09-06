-- plugins/cokeline.lua

return {
  "willothy/nvim-cokeline",
  config = function()
    require("cokeline").setup({
      -- Set tab colors
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and "#D8DEE9" or "#D8DEE9"
        end,
        bg = function(buffer)
          return buffer.is_focused and "#5E81AC" or "#3B4252"
        end,
      },

      -- Set sidebar
    sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  The File Tree',
            --style = 'bold',
        bold = true,
      },
    }
  },

      -- Set individual tab components
      components = {
         {
          text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
         },
        { text = " " },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            return buffer.filename .. " "
          end,
        },
        {
          text = function(buffer)
            return buffer.is_modified and "●" or ""
          end,
          fg = function(buffer)
            return buffer.is_modified and "#8be9fd" or nil
          end,
          delete_buffer_on_left_click = false,
          truncation = { priority = 1 },
        },

        { text = " " },
      },
    })
  end,
}
