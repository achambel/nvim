vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/rofi/.*%.rasi"] = "rasi"
  }
})
