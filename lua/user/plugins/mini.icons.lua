return {
  'echasnovski/mini.icons',
  event = "VeryLazy",
  config = vim.schedule(function()
    require("mini.icons").setup()
  end)
}
