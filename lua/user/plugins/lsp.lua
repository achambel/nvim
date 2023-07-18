local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "tsserver",
  "jsonls",
  "lua_ls",
  "elixirls",
  "emmet_ls",
}

local function config_lsp(lspconfig)
  local handlers = require("user.config.lsp.handlers")

  for _, server in pairs(servers) do
    local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities
    }

    local has_custom_opts, server_custom_opts = pcall(require, "user.config.lsp.servers." .. server)

    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end

    lspconfig[server].setup(opts)
  end

  handlers.setup()
end

return {
  {
    "neovim/nvim-lspconfig",
    commit = "1c13e529bd5683b54a39b633a560d2f00fcb25af",
    event = { "BufReadPost", "BufNewFile" },
    config = vim.schedule(function()
      local lspconfig = require("lspconfig")
      config_lsp(lspconfig)
    end),
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "bbaf5a96913aa92281f154b08732be2f57021c45",
    event = { "BufReadPost", "BufNewFile" },
    requires = { "nvim-lua/plenary.nvim" },
    config = vim.schedule(function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.credo.with({
            filetypes = { "elixir" }
          }),
          null_ls.builtins.formatting.prettier
        }
      })
    end)
  }
}
