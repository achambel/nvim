return {
  "echasnovski/mini.ai",
  commit = "a9b992b13d22a8db8df6beac25afa59a10b5584d",
  event = { "BufReadPost", "BufNewFile" },
  config = vim.schedule(function()
    require("mini.ai").setup()
  end)
}
