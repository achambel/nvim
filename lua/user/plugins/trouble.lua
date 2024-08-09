local function keymaps()
  local keymap = require("user.utils").keymap

  keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
  keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
  keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")
  keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
  keymap("n", "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>")
end

return {
  "folke/trouble.nvim",
  commit = "6efc446226679fda0547c0fd6a7892fd5f5b15d8",
  event = "VeryLazy",
  opts = {
    use_diagnostic_signs = true
  },
  init = vim.schedule(keymaps)
}
