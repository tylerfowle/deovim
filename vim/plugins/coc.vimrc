" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" coc extensions
let g:coc_global_extensions = ["coc-css","coc-dictionary" ,"coc-eslint" ,"coc-highlight" ,"coc-html" ,"coc-json" ,"coc-lists" ,"coc-snippets" ,"coc-solargraph" ,"coc-tag" ,"coc-tsserver" ,"coc-ultisnips" ,"coc-vetur" ,"coc-word"]

" Remap keys for gotos {{{

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" }}}


" Using CocList {{{

nnoremap <silent> <space>l  :<C-u>CocList<cr>
nnoremap <silent> <space>m  :<C-u>CocList mru<cr>
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>f  :<C-u>CocList files<cr>
nnoremap <silent> <space>b  :<C-u>CocList buffers<cr>
nnoremap <silent> <space>q  :<C-u>CocList quickfix<cr>
nnoremap <silent> <space>w  :<C-u>CocList -I words<cr>
nnoremap <silent> <space>g  :<C-u>CocList -I grep<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next or prev item
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list
nnoremap <silent> <space><space>  :<C-u>CocListResume<CR>
nnoremap <silent> <space>r  :<C-u>CocListResume<CR>

" }}}


" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
