return {
  "windwp/nvim-autopairs",
  commit = "4a39f2dcbe1967ddc3a0f76f863540dd3aa7871a",
  event = "InsertEnter",
  config = vim.schedule(function()
    require("nvim-autopairs").setup()
  end)
}
