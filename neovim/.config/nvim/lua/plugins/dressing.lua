return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        border = "single",
      },
      select = {
        telescope = require("telescope.themes").get_dropdown({
          borderchars = {
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          },
        }),
      },
    })
  end,
}
