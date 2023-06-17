return {
  {
    "lewis6991/gitsigns.nvim",
    commit = "4455bb5364d29ff86639dfd5533d4fe4b48192d4",
    event = "BufReadPre",
    config = vim.schedule(function()
      require('gitsigns').setup()
    end)
  }
}
