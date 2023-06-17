return {
  {
    "tpope/vim-surround",
    commit = "3d188ed2113431cf8dac77be61b842acb64433d9",
    event = "BufWinEnter"
  },

  {
    "tpope/vim-repeat",
    commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a",
    event = "BufWinEnter"
  },
  {
    "RRethy/vim-illuminate",
    commit = "a2907275a6899c570d16e95b9db5fd921c167502",
    event = "CursorMoved",
    config = vim.schedule(function()
      require('illuminate').configure({
        under_cursor = false,
        filetypes_denylist = {
          "TelescopePrompt",
          "NvimTree"
        }
      })
    end)
  }
}
