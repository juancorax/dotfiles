return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap.set

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

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
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local util = require("lspconfig.util")

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "blade",
            "css",
            "eruby",
            "html",
            "javascriptreact",
            "typescriptreact",
          },
        })
      end,
      ["tailwindcss"] = function()
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          settings = {
            tailwindCSS = {
              classAttributes = {
                "class",
                "className",
                "class:list",
                "classList",
                "ngClass",
                "data-.*-class",
              },
            },
          },
          root_dir = function(fname)
            return util.root_pattern(
              "tailwind.config.js",
              "tailwind.config.cjs",
              "tailwind.config.mjs",
              "tailwind.config.ts",
              "postcss.config.js",
              "postcss.config.cjs",
              "postcss.config.mjs",
              "postcss.config.ts",
              "config/tailwind.config.js",
              "config/postcss.config.js"
            )(fname)
          end,
        })
      end,
    })
  end,
}
