return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      user_default_options = {
        css = true,
        tailwind = true,
      },
    })
  end,
}
