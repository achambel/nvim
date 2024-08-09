return {
  {
    "nvim-telescope/telescope.nvim",
    commit = "3b1600d0fd5172ad9fae00987362ca0ef3d8895d",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683"
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
      }
    },
    opts = {
    },
    config = vim.schedule(function()
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          previewer = true,
          path_display = { "shorten" },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.6,
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
