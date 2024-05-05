return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()

    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "open parent directory" })
  end,
}
