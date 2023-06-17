vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup('UserAutoCmd', { clear = true }),
  pattern = "*",
  command = "lua vim.lsp.buf.format()"
})
