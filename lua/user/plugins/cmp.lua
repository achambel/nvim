return {
  {
    "hrsh7th/nvim-cmp",
    commit = "b8c2a62b3bd3827aa059b43be3dd4b5c45037d65",
    event = "InsertEnter",
    config = vim.schedule(function()
      require("config.cmp")
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
        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f12408bdb54c39c23e67cab726264c10db33ada8"
      },
      {
        "saadparwaiz1/cmp_luasnip",
        commit = "18095520391186d634a0045dacaa346291096566",
      },
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        commit = "65565c62963579897d28390dbd1ba8fb15ba545f"
      }
    }
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    commit = "fcdaa4313305fe20d928551134c1ec2266e7af2a",
    event = "VeryLazy"
  },
  {
    "rafamadriz/friendly-snippets",
    commit = "49ca2a0e0e26427b550b1f64272d7fe7e4d7d51b",
    event = "VeryLazy"
  }
}
