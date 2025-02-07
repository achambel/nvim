return {
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  --[[ cmd = { vim.fn.expand("~/.lsp/lexical/_build/dev/package/lexical/bin/start_lexical.sh") }, ]]
  cmd = { vim.fn.expand("~/.lsp/elixir-ls/release/language_server.sh") },
  settings = {},
}
