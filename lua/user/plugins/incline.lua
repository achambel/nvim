local icons = require("user.utils").glyphs
local get_hex_color = require("user.utils").get_hex_color

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
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
    local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)

    local modified = vim.api.nvim_buf_get_option(props.buf, "modified")

    local fancy_filename = vim.split(filename, "/")

    local buffer = {
      { ft_icon, guifg = ft_color }, { " " },
      { table.concat(fancy_filename, "  "), gui = modified and 'bold,italic' or 'bold' },
      -- status
      {
        modified and " " .. icons.dot or " ",
        guifg = get_hex_color("BufferCurrentTarget", "fg#"),
        gui = 'bold'
      }
    }

    return buffer
  end
}

return {
  "b0o/incline.nvim",
  commit = "16fc9c073e3ea4175b66ad94375df6d73fc114c0",
  event = "BufReadPre",
  config = vim.schedule_wrap(function()
    require('incline').setup(opts)
  end),
}
