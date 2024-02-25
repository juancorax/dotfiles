return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })
    telescope.load_extension("fzf")

    local keymap = vim.keymap.set
    local builtin = require("telescope.builtin")
    local function live_grep_open_files()
      builtin.live_grep({
        grep_open_files = true,
      })
    end
    keymap("n", "<leader>ff", builtin.find_files, { desc = "lists files in your current working directory" })
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "search for a string in your current working directory" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "lists open buffers" })
    keymap("n", "<leader>/", live_grep_open_files, { desc = "live grep in open files" })
    keymap("n", "<leader>fd", builtin.diagnostics, { desc = "lists diagnostics" })
  end,
}
