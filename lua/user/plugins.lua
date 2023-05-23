local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use({ "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim", commit = "9ac3e9541bbabd9d73663d757e4fe48a675bb054" })  -- Useful lua functions used by lots of plugins
  use({ "windwp/nvim-autopairs", commit = "7747bbae60074acf0b9e3a4c13950be7a2dff444" })  -- Autopairs, integrates with both cmp and treesitter
  use({ "numToStr/Comment.nvim", commit = "e1fe53117aab24c378d5e6deaad786789c360123" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3" })
  use({ "nvim-tree/nvim-web-devicons", commit = "e283ab937e0197b37ec5d8013e49495193407324" })
  use({ "nvim-tree/nvim-tree.lua", commit = "b1e074d2b52d45c8327b5b43a498b3d7e6c93b97" })
  use({
    "akinsho/bufferline.nvim",
    commit = "32d74d5d044f7cc89892d4781a83d55ee4ed552a",
    requires = 'nvim-tree/nvim-web-devicons'
  })
  use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
  use({
    "nvim-lualine/lualine.nvim",
    commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })

  use({ "lukas-reineke/indent-blankline.nvim", commit = "86d1b71c5c26168c3a3a9ff5f69e833889a09c1d" })
  use({ "goolord/alpha-nvim", commit = "1838ae926e8d49fe5330d1498ee8289ae2c340bc" })
  use({ "folke/which-key.nvim", commit = "e271c28118998c93a14d189af3395812a1aa646c" })
  use({ "folke/trouble.nvim", commit = "5da13b5007eb2b952834186cd640a22c765b64cf" })
  use({ "karb94/neoscroll.nvim", commit = "d7601c26c8a183fa8994ed339e70c2d841253e93" })
  use({ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" })
  use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })

  -- Colorschemes
  use({ "folke/tokyonight.nvim", commit = "6972aade12a9c6ecbbd163739d7617c21fc6bc4b" })

  -- Color highlighter
  use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp", commit = "3ac8d6cd29c74ff482d8ea47d45e5081bfc3f5ad" })         -- The completion plugin
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })       -- buffer completions
  use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" })         -- path completions
  use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" })

  -- snippets
  use({ "L3MON4D3/LuaSnip", commit = "fcdaa4313305fe20d928551134c1ec2266e7af2a" })             --snippet engine
  use({ "rafamadriz/friendly-snippets", commit = "ef6547d2f586e08e071efeebac835e545f3015cc" }) -- a bunch of snippets to use

  -- LSP
  use({
    "williamboman/mason.nvim",
    commit = "08b2fd308e0107eab9f0b59d570b69089fd0b522",
    run = ":MasonUpdate"
  })
  use({ "williamboman/mason-lspconfig.nvim", commit = "c55d18f3947562e699d34d89681edbf9f0e250d3" })
  use({ "neovim/nvim-lspconfig", commit = "1c13e529bd5683b54a39b633a560d2f00fcb25af" })           -- enable LSP
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "77e53bc3bac34cc273be8ed9eb9ab78bcf67fa48" }) -- for formatters and linters


  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "057ee0f8783872635bc9bc9249a4448da9f99123" })
  use({ "nvim-telescope/telescope-ui-select.nvim", commit = "62ea5e58c7bbe191297b983a9e7e89420f581369" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", commit = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16" })

  -- Git
  use({ "lewis6991/gitsigns.nvim", commit = "c18b7ca0b5b50596722f3a1572eb9b8eb520c0f1" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
