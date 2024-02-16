return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "html",
        "lua_ls",
        "tsserver",
      },
      automatic_installation = true,
    })

    mason_null_ls.setup({
      ensure_installed = {
        "stylua",
      },
      automatic_installation = true,
    })
  end,
}
