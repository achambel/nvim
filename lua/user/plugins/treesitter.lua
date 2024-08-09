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
    commit = "3d1f5e7df8d9981ec0bcf4aa635c0cc0a7ee89d9",
    event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    init = vim.schedule_wrap(function()
      vim.cmd("TSUpdate")
    end),
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        commit = "0f3332788e0bd37716fbd25f39120dcfd557c90f",
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
