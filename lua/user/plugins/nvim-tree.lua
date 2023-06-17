local icons = require("user.utils").icons
local tree = icons.tree
local git = icons.git

local function subscribe()
  local api = require('nvim-tree.api')

  -- Automatically open file upon creation
  api.events.subscribe(api.events.Event.FileCreated, function(file)
    vim.cmd('edit ' .. file.fname)
  end)
end

local opts = {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    icons = {
      glyphs = {
        default = tree.file,
        symlink = tree.symlink,
        folder = tree.folder,
        git = {
          unstaged = git.unstaged,
          staged = git.staged,
          unmerged = git.unmerged,
          renamed = git.renamed,
          untracked = git.untracked,
          deleted = git.deleted,
          ignored = git.ignored,
        },
      },
    }
  },
  filters = {
    custom = { "^\\.git$" }
  },
  reload_on_bufenter = true,
}

return {
  {
    "nvim-tree/nvim-tree.lua",
    commit = "b1e074d2b52d45c8327b5b43a498b3d7e6c93b97",
    cmd = "NvimTreeToggle",
    opts = opts,
    config = vim.schedule(subscribe)
  }

}
