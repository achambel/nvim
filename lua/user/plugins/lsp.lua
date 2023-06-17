local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "tsserver",
  "jsonls",
  "lua_ls",
  "elixirls"
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
}
