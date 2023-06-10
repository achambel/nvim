local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local icons = require("user.icons")

local lsp = {
  -- Lsp server name .
  function()
    local message = 'No Active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return message
    end

    local client_names = {}

    for i, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        client_names[i] = client.name
      end
    end

    local items = table.maxn(client_names)

    if items == 0 then
      return message
    elseif items == 1 then
      return table.concat(client_names, "")
    else
      return string.format("[%s]", table.concat(client_names, ", "))
    end
  end,

  icon = icons.lsp.server,
  color = { gui = 'bold' }
}

local icon = {
  "filetype",
  icon_only = true
}

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
    return "-- " .. str .. " --"
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
    for b = 1, vim.fn.bufnr('$') do
      if vim.fn.buflisted(b) ~= 0 and vim.api.nvim_buf_get_option(b, 'buftype') ~= 'quickfix' then
        total = total + 1
      end
    end

    return total > 1 and total or ""
  end,
  icon = icons.buffer.files
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { branch },
    lualine_b = { mode },
    lualine_c = { "diagnostics" },
    lualine_x = { diff, lsp },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_a = { buffers },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { icon },
    lualine_y = { "filename" },
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_x = { icon },
    lualine_y = { "filename" },
  },
  extensions = {},
})
