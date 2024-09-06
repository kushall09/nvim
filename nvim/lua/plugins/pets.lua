return {
  "kushall09/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
  opts = {},
  cmd = { "PetsNew", "PetsNewCustom" },

  config = function()
    require("pets").setup({
      row = 4,
      col = -10,
      speed_multiplier = 1,
      default_pet = "dog",
      default_style = "brown",
      random = true,
      death_animation = true,
      popup = {
        width = "8%",
        winblend = 100,
        hl = { Normal = "Normal" },
        avoid_statusline = false,
      },
    })
  end
}
