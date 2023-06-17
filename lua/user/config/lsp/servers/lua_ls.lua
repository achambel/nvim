return {
  settings = {
    Lua = {
      completion = {
        workspaceWord = true,
        callSnippet = "Replace",
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      diagnostics = {
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
