return {
  "windwp/nvim-autopairs",
  commit = "7747bbae60074acf0b9e3a4c13950be7a2dff444",
  event = "InsertEnter",
  config = vim.schedule(function()
    require("nvim-autopairs").setup()
  end)
}
