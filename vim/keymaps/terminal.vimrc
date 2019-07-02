" Terminal Shortcuts {{{

if has('nvim')
  " make esc work like other modes
  tnoremap <Esc> <C-\><C-n>
  " nav splits like normal
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " create a terminal below that is 10 high and default to insert mode
  " noremap <leader>tt :10sp<CR>:term<CR>file Context<CR>i

  highlight TermCursor ctermfg=black guifg=black
  noremap <localleader>t :call OpenTerminal()<CR>
  function! OpenTerminal()

    let bnr = bufwinnr("TERM")
    if bnr > 0
      " activate window
      :exe bnr . "wincmd w"
      :startinsert
    elseif bufnr("TERM") > 0
      10sp
      buf TERM
      :startinsert
    else
      " no TERM, make one
      10sp
      :term
      file TERM
      :set ft=terminal
      :startinsert
    endif
  endfunction

endif
