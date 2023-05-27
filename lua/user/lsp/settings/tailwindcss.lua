local lspconfig = require("lspconfig")

return {
  root_dir = lspconfig.util.root_pattern(
    'tailwind.config.js',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.ts',
    'package.json',
    'node_modules',
    '.git',
    'mix.exs'
  ),
  filetypes = {
    'html',
    'typescriptreact',
    'javascriptreact',
    'css',
    'sass',
    'scss',
    'less',
    'elixir',
    'eelixir',
    'heex'
  },
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
        },
      },
    },
  },
}
