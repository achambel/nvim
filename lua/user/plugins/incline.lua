local icons = require("user.utils").glyphs

local opts = {
  window = {
    margin = { vertical = 0, horizontal = 0 },
    winhighlight = {
      active = { Normal = 'StatusLine' },
      inactive = { Normal = 'StatusLineNC' },
    }
  },
  hide = {
    cursorline = true,
  },
  render = function(props)
    if vim.bo.filetype == "oil" then return {} end

    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
    local ft_icon, hl = require("mini.icons").get("file", filename)
    local hi = vim.api.nvim_get_hl(0, { name = hl })
    local color = string.format("#%06x", hi.fg)

    local modified = vim.api.nvim_get_option_value("modified", { buf = props.buf })
    local fancy_filename = vim.split(filename, "/")

    local buffer = {
      { ft_icon, guifg = color }, { " " },
      { table.concat(fancy_filename, "  "), gui = modified and 'bold,italic' or 'bold' },
      -- status
      {
        modified and " " .. icons.dot or " ",
        gui = 'bold'
      }
    }

    return buffer
  end
}

return {
  "b0o/incline.nvim",
  commit = "16fc9c073e3ea4175b66ad94375df6d73fc114c0",
  event = "BufEnter",
  config = vim.schedule_wrap(function()
    require('incline').setup(opts)
  end),
}
