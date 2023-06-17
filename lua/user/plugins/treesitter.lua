function _G.ensure_treesitter_language_installed()
  local ok, parsers = pcall(require, 'nvim-treesitter.parsers')
  if not ok then
    return
  end

  local lang = parsers.get_buf_lang()

  if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
    vim.cmd("TSInstall " .. lang)
  end
end

vim.cmd("autocmd FileType * :lua ensure_treesitter_language_installed()")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "150be01d47579ba70137813348a2f0a5be7a7866",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    init = vim.schedule_wrap(function()
      vim.cmd("TSUpdate")
    end),
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        commit = "cf618047619def57127fdd983f73e5bda373ccc0",
      }
    },
    opts = {
      ensure_installed = {}, -- will install missing ones on demand as soon as your enter on buffer. See autocmd above
      sync_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      }
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
}
