return {
  {
    "lewis6991/gitsigns.nvim",
    commit = "0b04035bb7b3c83e999b9676e2fb46fd0aa9f910",
    event = "BufReadPre",
    config = vim.schedule(function()
      require('gitsigns').setup()
    end)
  }
}
