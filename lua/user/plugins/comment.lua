return {
  "numToStr/Comment.nvim",
  commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", commit = "6b5f95aa4d24f2c629a74f2c935c702b08dbde62" },
  event = "BufReadPost",
  config = vim.schedule(function()
    local comment = require("Comment")
    comment.setup {
      pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
          location = location,
        }
      end,
    }
  end)
}
