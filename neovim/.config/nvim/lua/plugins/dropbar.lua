return {
  "Bekaboo/dropbar.nvim",
  config = function()
    require("dropbar").setup({
      icons = {
        enable = false,
        ui = {
          bar = {
            separator = " >",
          },
        },
      },
      bar = {
        sources = function(buf, _)
          local sources = require("dropbar.sources")
          local utils = require("dropbar.utils")
          if vim.bo[buf].ft == "markdown" then
            return {
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == "terminal" then
            return {
              sources.terminal,
            }
          end
          return {
            utils.source.fallback({
              sources.lsp,
              sources.treesitter,
            }),
          }
        end,
        padding = {
          left = 0,
          right = 0,
        },
      },
    })
  end,
}