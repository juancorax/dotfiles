return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        ruby = { "rubocop" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
