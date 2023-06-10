-- find more here: https://www.nerdfonts.com/cheat-sheet
local glyphs = {
  file = "",
  code_file = "",
  symlink = "",
  arrow_open = "",
  arrow_closed = "",
  folder = {
    closed = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local icons = {
  lsp = {
    server = ",",
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
    file = glyphs.code_file,
    reference = glyphs.symlink,
    folder = glyphs.folder.closed,
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
    branch = "",
    unstaged = "",
    staged = "󰎔",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = "◌",
  },
  buffer = {
    files = "󱔗"
  },
  diagnostic = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  },
  tree = {
    file = glyphs.file,
    symlink = glyphs.symlink,
    folder = {
      arrow_open = glyphs.arrow_open,
      arrow_closed = glyphs.arrow_closed,
      default = glyphs.folder.closed,
      open = glyphs.folder.open,
      empty = glyphs.folder.empty,
      empty_open = glyphs.folder.empty_open,
      symlink = glyphs.folder.symlink,
      symlink_open = glyphs.folder.symlink
    }
  },
  telescope = {
    prompt_prefix = " ",
    selection_caret = " ",
  }
}

return icons
