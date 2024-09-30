return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "kanagawa",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = {},
      },
    })
  end,
}
