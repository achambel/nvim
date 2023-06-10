-- A builtin Lua module which byte-compiles and caches Lua files (speeds up load times)
vim.loader.enable()

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end


-- Non-plugins configs
require "user.options"
require "user.keymaps"
require "user.autocommands"

-- Plugin configs
require "user.plugins"
require "user.colorscheme"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.lualine"
require "user.whichkey"
require "user.trouble"
require "user.neoscroll"
require "user.colorizer"
require "user.cmp"
require "user.mason"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.gitsigns"
require "user.tailwindcss"
require "user.elixir"
