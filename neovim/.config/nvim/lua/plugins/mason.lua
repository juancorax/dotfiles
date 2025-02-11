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
        "html",
        "lua_ls",
        "phpactor",
        "ruby_lsp",
        "tailwindcss",
        "ts_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "blade-formatter",
        "erb-formatter",
        "eslint_d",
        "pint",
        "prettier",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    })
  end,
}
