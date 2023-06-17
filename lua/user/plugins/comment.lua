return {
  "numToStr/Comment.nvim",
  commit = "e1fe53117aab24c378d5e6deaad786789c360123",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", commit = "0bf8fbc2ca8f8cdb6efbd0a9e32740d7a991e4c3" },
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
