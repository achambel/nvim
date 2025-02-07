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
      { "<leader>e", "<cmd>Oil<cr>", desc = "explorer", icon = "󰝰 " },
      { "<leader>E", "<cmd>Oil --float<cr>", desc = "explorer(float)", icon = "󰝰 " },
      { "<leader>q", "<cmd>q<cr>", desc = "quit" },
      { "<leader>h", "<cmd>set hls!<cr>", desc = "toggle highlight" },
      { "<leader>w", "<cmd>w<cr>", desc = "save file", icon = "󰆓 " },

      { "<leader>b", group = "buffers", icon = "󱔗 " },
      { "<leader>bf", "<cmd>FzfLua buffers<cr>", desc = "filter" },
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

      { "<leader>o", group = "fzf" },
      { "<leader>oo", "<cmd>FzfLua files<cr>", desc = "find files" },
      { "<leader>og", "<cmd>FzfLua live_grep resume=true<cr>", desc = "live grep", icon = "󰈲 " },
      { "<leader>ov", "<cmd>FzfLua git_files<cr>", desc = "git files" },


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
      { "<leader>go", "<cmd>FzfLua git_status<cr>", desc = "open changed file" },
      { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "checkout branch" },
      { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "checkout commit" },
      { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "diff", },

      { "<leader>l", group = "LSP", icon = " " },
      { "<leader>ld", "<cmd>FzfLua diagnostics_document<cr>", desc = "document diagnostics" },
      { "<leader>lw", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "workspace diagnostics", },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "info" },
      { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "installer info" },
      { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next diagnostic", },
      { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "prev diagnostic", },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "loc list diagnostic" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "rename" },
      { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "document symbols" },
      { "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "workspace symbols", },

      { "<leader>s", group = "search" },
      { "<leader>sc", "<cmd>FzfLua colorschemes<cr>", desc = "colorschemes", icon = "🎨" },
      { "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "help tags", icon = "💡" },
      { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "man pages", icon = "📘" },
      { "<leader>sr", "<cmd>FzfLua oldfiles<cr>", desc = "open recent file", icon = "📄" },
      { "<leader>sR", "<cmd>FzfLua registers<cr>", desc = "registers", icon = "🤔" },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "keymaps", icon = "⌨️" },
      { "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "commands", icon = "⚙️" },
    })
  end),
}
