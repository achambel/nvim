local utils = require("user.utils")
local icons = utils.icons
local lsp = utils.lsp

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diff = {
  "diff",
  colored = true,
  symbols = icons.git.diff,
  cond = hide_in_width
}

local mode = {
  "mode",
  fmt = function(str)
    return (icons.mode[str] or "") .. string.format(" %s", str)
  end,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = icons.git.branch
}

local buffers = {
  function()
    local buffers = utils.get_listed_buffers()
    local total = #buffers

    return total > 1 and total or ""
  end,
  icon = icons.buffer.files
}

local options = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    globalstatus = false,
    disabled_filetypes = { "oil" }
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diff },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = icons.glyphs.error .. " ",
          warn = icons.glyphs.warn .. " ",
          info = icons.glyphs.question .. " ",
          hint = icons.glyphs.hint .. " "
        },
        on_click = function()
          vim.cmd('Trouble')
        end
      }
    },
    lualine_x = { lsp },
    lualine_y = { 'location', 'progress' },
    lualine_z = { buffers },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},

}

return {
  "nvim-lualine/lualine.nvim",
  commit = "544dd1583f9bb27b393f598475c89809c4d5e86b",
  event = "BufReadPost",
  config = vim.schedule(function()
    require("lualine").setup(options)
  end)
}
