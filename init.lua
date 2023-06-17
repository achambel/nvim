-- A builtin Lua module which byte-compiles and caches Lua files (speeds up load times)
vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  spec = {
    { import = "user.plugins" }
  },
  ui = {
    checker = {
      enabled = true
    }
  },
  change_detection = {
    notify = false,
  },
}

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- It follows the lazy plugin spec
-- See more on https://github.com/folke/lazy.nvim#-plugin-spec
-- Plugin Manager
require("lazy").setup(opts)
