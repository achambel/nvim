local M = {}
local diagnostic = require("user.utils").icons.diagnostic

M.register = function()
  local group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      -- Enable completion triggered by <c-x><c-o>
      if client.server_capabilities.completionProvider then
        vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
      end

      if client.server_capabilities.definitionProvider then
        vim.bo[buffer].tagfunc = "v:lua.vim.lsp.tagfunc"
      end

      local keymap = vim.keymap.set
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      keymap('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = buffer })
      keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition", buffer = buffer })
      keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation", buffer = buffer })
      keymap('n', 'gr', vim.lsp.buf.references, { desc = "Go to References", buffer = buffer })
      keymap('n', 'gl', vim.diagnostic.open_float, { desc = "Float Diagnostic", buffer = buffer })
      keymap('n', 'K', vim.lsp.buf.hover)
      keymap('n', '<leader>da', vim.lsp.buf.add_workspace_folder,
        { desc = "Add workspace folder to LSP context", buffer = buffer })
      keymap('n', '<leader>dr', vim.lsp.buf.remove_workspace_folder,
        { desc = "Remove workspace folder from LSP context", buffer = buffer })
      keymap('n', '<leader>dl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List Workspace folders in LSP context", buffer = buffer })
      keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "Go to Type Definition", buffer = buffer })
      keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename", buffer = buffer })
      keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action", buffer = buffer })
      keymap('n', '<C-k>', vim.lsp.buf.signature_help)
      keymap('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, { desc = "Format", buffer = buffer })
    end
  })
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = diagnostic.error },
    { name = "DiagnosticSignWarn",  text = diagnostic.warn },
    { name = "DiagnosticSignHint",  text = diagnostic.hint },
    { name = "DiagnosticSignInfo",  text = diagnostic.info },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local diagnostics = {
    signs = {
      active = signs,
    },
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "if_many",
      header = "",
      prefix = "",
    },
    --
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
      -- prefix = "",
    },
    severity_sort = true,
  }

  vim.diagnostic.config(diagnostics)
  M.register()


  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

M.on_attach = function(client)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M
