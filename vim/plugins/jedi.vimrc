" ##############################################################################
" Jedi-vim
" https://github.com/davidhalter/jedi-vim
" ##############################################################################

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',jd'
" Find ocurrences
let g:jedi#usages_command = ',jo'
" Find assignments
let g:jedi#goto_assignments_command = ',ja'
" Go to definition in new tab
" nnoremap ,D :tab split<CR>:call jedi#goto()<CR>
let g:jedi#rename_command = ""
