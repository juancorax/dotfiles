return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local keymap = vim.keymap.set

    null_ls.setup({
      sources = {
        formatting.stylua,
      }
    })

    keymap("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
