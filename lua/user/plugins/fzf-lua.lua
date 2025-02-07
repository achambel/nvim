local chafa = { "chafa", "--align", "center,center", "--scale", "max", "--stretch" }

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  event = "VeryLazy",
  config = vim.schedule(function()
    require("fzf-lua").setup({
      previewers = {
        builtin = {
          extensions = {
            ["png"] = chafa,
            ["jpg"] = chafa,
            ["webp"] = chafa,
          }
        }
      }
    })
  end)
}
