return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "emmet_ls",
        "gopls",
        "html",
        "lua_ls",
        "phpactor",
        "tailwindcss",
        "ts_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "blade-formatter",
        "djlint",
        "eslint_d",
        "golangci-lint",
        "pint",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    })
  end,
}
