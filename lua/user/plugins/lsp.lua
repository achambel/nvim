local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "tsserver",
  "jsonls",
  "lua_ls",
  "elixirls",
  "emmet_ls",
  "rust_analyzer",
  "csharp_ls",
  "bashls"
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
    commit = "0b8165cf95806bc4bb8f745bb0c92021b2ed4b98",
    event = { "BufReadPost", "BufNewFile" },
    config = vim.schedule(function()
      local lspconfig = require("lspconfig")
      config_lsp(lspconfig)
    end),
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
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
