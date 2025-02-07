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
    commit = "bcd0b26607c1a4336c392285a9f13e31f514ccf2",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    init = vim.schedule_wrap(function()
      vim.cmd("TSUpdate")
    end),
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        commit = "bece284c5322ddf6946fa4bdc383a2bc033269d7",
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
