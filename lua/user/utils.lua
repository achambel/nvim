local M = {}

-- Shorten function name
M.keymap = function(mode, lhs, rhs, opts)
  local defaults = { noremap = true, silent = true }
  opts = vim.tbl_deep_extend("force", defaults, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end


-- Get a hex color from a given group.
-- Example: get_hex_color("BufferCurrentTarget", "fg#") will return #ff757f
---@param group string The highlight group name
---@param attr string The attribute of the given group name
---@return string
M.get_hex_color = function(group, attr)
  local cmd = string.format('echo synIDattr(synIDtrans(hlID("%s")), "%s")', group, attr)
  return vim.api.nvim_command_output(cmd)
end

M.get_listed_buffers = function()
  local listed = {}

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      table.insert(listed, buf)
    end
  end

  return listed
end

-- find more here: https://www.nerdfonts.com/cheat-sheet
M.glyphs = {
  file = "",
  code_file = "",
  symlink = "",
  arrow_open = "",
  arrow_closed = "",
  folder = {
    closed = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
  error = "",
  warn = "",
  hint = "",
  question = "",
  locker = "",
  dot = ""
}

M.icons = {
  lsp = {
    server = "",
    text = "󰦨",
    method = "",
    fn = "󰊕",
    constructor = "",
    field = "",
    variable = "",
    class = "",
    interface = "",
    module = "",
    property = "",
    unit = "",
    value = "󱀍",
    enum = "",
    keyword = "",
    snippet = "",
    color = "",
    file = M.glyphs.code_file,
    reference = M.glyphs.symlink,
    folder = M.glyphs.folder.closed,
    enum_member = "",
    constant = "",
    struct = "",
    event = "",
    operator = "",
    type_parameter = "",
    path = ""
  },
  git = {
    diff = {
      added = " ",
      modified = " ",
      removed = " "
    },
    branch = "",
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = "",
  },
  buffer = {
    files = "󱔗"
  },
  diagnostic = {
    -- nf-oct-* icons
    error = M.glyphs.error,
    warn = M.glyphs.warn,
    hint = M.glyphs.hint,
    info = M.glyphs.question
  },
  tree = {
    file = M.glyphs.file,
    symlink = M.glyphs.symlink,
    folder = {
      arrow_open = M.glyphs.arrow_open,
      arrow_closed = M.glyphs.arrow_closed,
      default = M.glyphs.folder.closed,
      open = M.glyphs.folder.open,
      empty = M.glyphs.folder.empty,
      empty_open = M.glyphs.folder.empty_open,
      symlink = M.glyphs.folder.symlink,
      symlink_open = M.glyphs.folder.symlink
    }
  },
  mode = {
    INSERT = "",
    COMMAND = "",
    VISUAL = "󰈈",
    ["V-LINE"] = "",
    ["V-BLOCK"] = "",
  },
  glyphs = M.glyphs
}

M.lsp = {
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

    local items = #client_names

    if items == 0 then
      return message
    elseif items == 1 then
      return table.concat(client_names, "")
    else
      return string.format("[%s]", table.concat(client_names, ", "))
    end
  end,
  on_click = function()
    vim.cmd("LspInfo")
  end,
  icon = M.icons.lsp.server,
  color = { gui = 'bold' },

}

return M
