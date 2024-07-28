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
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
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
        "prettierd",
        "pylint",
        "rubocop",
        "stylua",
      },
    })
  end,
}
