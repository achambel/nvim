return {
  {
    "hrsh7th/nvim-cmp",
    commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
    event = "InsertEnter",
    config = vim.schedule(function()
      require("user.config.cmp")
    end),
    dependencies = {
      {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
      },
      {
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d",
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f12408bdb54c39c23e67cab726264c10db33ada8"
      },
      {
        "saadparwaiz1/cmp_luasnip",
        commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
      },
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        commit = "3d3cd95e4a4135c250faf83dd5ed61b8e5502b86"
      }
    }
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    commit = "b84eeb3641b08324287587b426ec974b888390d9",
    event = "VeryLazy"
  },
  {
    "rafamadriz/friendly-snippets",
    commit = "00ebcaa159e817150bd83bfe2d51fa3b3377d5c4",
    event = "VeryLazy"
  }
}
