local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup {
  user_default_options = {
    tailwind = true,
    css = true,
    css_fn = true
  },
  buftypes = {
    "*",
    -- exclude prompt and popup buftypes from highlight
    "!prompt",
    "!popup",
  }
}
