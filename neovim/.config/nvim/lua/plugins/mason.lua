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
        "pyright",
        "solargraph",
        "tsserver",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "eslint_d",
        "isort",
        "pint",
        "prettier",
        "prettierd",
        "pylint",
        "rubocop",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    })
  end,
}
