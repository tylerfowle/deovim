" ##############################################################################
" vim-partial
" https://github.com/jbgutierrez/vim-partial
" ##############################################################################

let g:partial_templates_roots = [
      \ 'build',
      \ 'scss',
      \ 'build/scss',
      \ ]

vnoremap <localleader>x :PartialExtract<cr>
nnoremap <localleader>x :PartialDispose<cr>
