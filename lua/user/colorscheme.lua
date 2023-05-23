local status_ok, colorscheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

colorscheme.setup({
  style = 'storm'
})

vim.cmd.colorscheme("tokyonight")
