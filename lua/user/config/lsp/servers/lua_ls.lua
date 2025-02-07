local config = {
  settings = {
    Lua = {
      completion = {
        workspaceWord = true,
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { 'vim' },
        disable = { "incomplete-signature-doc" },
        neededFileStatus = {
          ["codestyle-check"] = "Any"
        }
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          continuation_indent_size = "2",
        },
      },
    }
  }
}

local config_path = vim.fn.stdpath('config')
local file_path = vim.fn.expand('%:p')
-- Make the server aware of Neovim runtime files
local load_lib = string.find(file_path, config_path)

config.settings.Lua.workspace = {
  checkThirdParty = false,
}

if load_lib then
  config.settings.Lua.workspace.library = {
    vim.env.VIMRUNTIME,
    config_path,
  }
end

return config
