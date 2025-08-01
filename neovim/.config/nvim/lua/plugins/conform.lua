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
        json = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 2000,
      },
    })
  end,
}
