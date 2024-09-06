-- plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nord",
        section_separators = { left = "", right = ""},
        component_separators = { left = "", right = ""},
        disabled_filetypes = { "nvim-tree" },
        always_divide_middle = true,
        -- globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = "  ",
              readonly = "[read-only]",
              unnamed = "",
            }
          }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = "  ",
              readonly = "[read-only]",
              unnamed = "",
            }
          }
        },
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      tabline = {},
      extensions = {}
    })
  end,
}

