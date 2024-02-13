return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup ({
      options = {
        icons_enabled = false,
        theme = "kanagawa",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end,
}
