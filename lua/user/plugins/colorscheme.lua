return {
  {
    "folke/tokyonight.nvim",
    commit = "6972aade12a9c6ecbbd163739d7617c21fc6bc4b",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },

}
