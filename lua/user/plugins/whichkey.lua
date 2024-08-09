return {
  "folke/which-key.nvim",
  commit = "6c1584eb76b55629702716995cca4ae2798a9cca",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    win = {
      border = 'single'
    }
  },
  config = vim.schedule(function()
    local wk = require("which-key")
    wk.add({
      {
        "<leader>?",
        function()
          wk.show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
        icon = "󰋗 "
      },
      { "<leader>/", "<cmd>norm gcc<cr>", desc = "comment", icon = "󰅺 " },
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "explorer", icon = "󰝰 " },
      { "<leader>q", "<cmd>q<cr>", desc = "quit" },
      { "<leader>h", "<cmd>set hls!<cr>", desc = "toggle highlight" },
      { "<leader>w", "<cmd>w<cr>", desc = "save file", icon = "󰆓 " },

      { "<leader>b", group = "buffers", icon = "󱔗 " },
      { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "filter" },
      {
        "<leader>bb",
        expand = function()
          return require("which-key.extras").expand.buf()
        end
        ,
        desc = "pick"
      },
      { "<leader>bo", "<cmd>%bdelete|edit #|normal `\"<cr>", desc = "close others" },
      { "<leader>ba", "<cmd>%bdelete<cr>", desc = "close all" },
      { "<leader>bc", "<cmd>bd<cr>", desc = "close current" },

      { "<leader>o", group = "telescope" },
      { "<leader>oo", "<cmd>Telescope find_files find_command=rg,--smart-case,--files<cr>", desc = "find files" },
      { "<leader>og", "<cmd>Telescope live_grep<cr>", desc = "live grep", icon = "󰈲 " },
      { "<leader>oh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
      { "<leader>ov", "<cmd>Telescope git_files<cr>", desc = "git files" },


      { "<leader>g", group = "git" },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "next hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "prev hunk" },
      { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "blame" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "preview hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "reset hunk" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "reset buffer" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "stage hunk" },
      {
        "<leader>gu",
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        desc = "Undo Stage Hunk",
      },
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "open changed file" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "checkout branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "checkout commit" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "diff", },

      { "<leader>l", group = "LSP", icon = " " },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "document diagnostics" },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "workspace diagnostics", },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "installer info" },
      { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next diagnostic", },
      { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "prev diagnostic", },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "loc list diagnostic" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "document symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "workspace symbols", },

      { "<leader>s", group = "search" },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "checkout branch" },
      { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "colorscheme" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "find help" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "man pages" },
      { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "open recent file" },
      { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "registers" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "keymaps" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "commands" },
    })
  end),
}
