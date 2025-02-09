return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    local keymap = vim.keymap.set

    keymap("n", "<leader>t", ":TestNearest<CR>", {})
    keymap("n", "<leader>T", ":TestFile<CR>", {})
    keymap("n", "<leader>a", ":TestSuite<CR>", {})
    keymap("n", "<leader>l", ":TestLast<CR>", {})
    keymap("n", "<leader>g", ":TestVisit<CR>", {})

    vim.cmd("let test#strategy = 'vimux'")
  end,
}
