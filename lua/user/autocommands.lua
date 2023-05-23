vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted

    " automatically leave insert mode after 'updatetime' milliseconds of inaction
    autocmd CursorHoldI * stopinsert 

    " set 'updatetime' to 15 seconds when in insert mode
    au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
    au InsertLeave * let &updatetime=updaterestore 
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
 
  augroup _lsp
   autocmd!
   autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end

  augroup _remember_folds
    autocmd!
    autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
  augroup END
]]
