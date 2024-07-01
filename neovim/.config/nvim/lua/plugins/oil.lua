return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      keymaps_help = {
        border = "single",
      },
      float = {
        border = "single",
      },
      preview = {
        border = "single",
      },
      progress = {
        border = "single",
      },
      ssh = {
        border = "single",
      },
    })

    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "open parent directory" })
  end,
}
