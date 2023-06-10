local group = vim.api.nvim_create_augroup('MyDefaultAU', { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.format()",
  group = group
})
