return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap.set

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "go to declaration"
      keymap("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "show lsp definitions"
      keymap("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "show documentation for what is under cursor"
      keymap("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "show lsp implementations"
      keymap("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "show lsp type definitions"
      keymap("n", "gt", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "smart rename"
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "see available code actions"
      keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "show lsp references"
      keymap("n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "show line diagnostics"
      keymap("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "go to previous diagnostic"
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "go to next diagnostic"
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
