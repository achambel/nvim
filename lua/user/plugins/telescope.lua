return {
  {
    "nvim-telescope/telescope.nvim",
    commit = "37c526857807e9550bdc8649700d4ceb47750ef2",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        commit = "36aaceb6e93addd20b1b18f94d86aecc552f30c4"
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        commit = "62ea5e58c7bbe191297b983a9e7e89420f581369",
      }
    },
    opts = {
    },
    config = vim.schedule(function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          previewer = true,
          path_display = { "smart" },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.7,
            },
            vertical = {
              prompt_position = "top",
              mirror = true,
            },
          },
          sorting_strategy = "ascending",
          winblend = 0,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()
          },
        }
      }
      telescope.load_extension("ui-select")
    end)
  },

}
