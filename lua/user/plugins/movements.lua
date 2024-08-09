return {
  {
    "tpope/vim-surround",
    commit = "3d188ed2113431cf8dac77be61b842acb64433d9",
    event = "BufWinEnter"
  },

  {
    "tpope/vim-repeat",
    commit = "65846025c15494983dafe5e3b46c8f88ab2e9635",
    event = "BufWinEnter"
  },
  {
    "RRethy/vim-illuminate",
    commit = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa",
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
