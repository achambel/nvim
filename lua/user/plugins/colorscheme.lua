return {
  {
    "folke/tokyonight.nvim",
    commit = "b0e7c7382a7e8f6456f2a95655983993ffda745e",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  {
    "brenoprata10/nvim-highlight-colors",
    commit = "a411550ef85cae467b889ba7d1a96bd78332d90e",
    event = { "BufReadPost", "BufNewFile" },
    config = vim.schedule(function()
      require("nvim-highlight-colors").setup {
        enable_tailwind = true
      }
    end)
  },
}
