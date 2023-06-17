local icons = require("user.utils").icons
local lsp = require("user.utils").lsp

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
    local total = 0

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.fn.buflisted(buf) == 1 then
        total = total + 1
      end
    end

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
    disabled_filetypes = { "NvimTree" }
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
  winbar = {
    --[[ lualine_a = { buffers }, ]]
    --[[ lualine_b = {}, ]]
    --[[ lualine_c = {}, ]]
    --[[ lualine_x = { icon }, ]]
    --[[ lualine_y = { ]]
    --[[   filename, ]]
    --[[   { ]]
    --[[     'filename', ]]
    --[[     newfile_status = true, ]]
    --[[     symbols = { ]]
    --[[       modified = icons.glyphs.dot .. ' ', ]]
    --[[       readonly = icons.glyphs.locker .. " [readonly]", ]]
    --[[       unnamed = icons.glyphs.question .. ' [No Name]', ]]
    --[[       newfile = icons.glyphs.file .. " [New File]" ]]
    --[[     }, ]]
    --[[     separator = { left = " ", right = "" }, ]]
    --[[     fmt = function(str) ]]
    --[[       -- keeps only the symbol. Eg: 'file.ext [+]' becomes '[+]' ]]
    --[[       return str:gsub(vim.fn.expand("%:t"), ""):match '^%s*(.*%S)' or '' ]]
    --[[     end, ]]
    --[[     color = function() ]]
    --[[       if vim.bo.modified then ]]
    --[[         return 'BufferAlternateTarget' ]]
    --[[       elseif vim.bo.readonly then ]]
    --[[         return 'BufferAlternateINFO' ]]
    --[[       elseif vim.bo.buftype == '' then ]]
    --[[         return 'BufferAlternateHINT' ]]
    --[[       end ]]
    --[[     end ]]
    --[[   } ]]
    --[[ }, ]]
    --[[ lualine_z = {}, ]]
  },
  inactive_winbar = {
    --[[ lualine_a = {}, ]]
    --[[ lualine_x = { icon }, ]]
    --[[ lualine_y = { filename, }, ]]
    --[[]]
  },
  extensions = {},

}

return {
  "nvim-lualine/lualine.nvim",
  commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
  event = "BufReadPost",
  config = vim.schedule(function()
    require("lualine").setup(options)
  end)
}
