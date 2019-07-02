" ##############################################################################
" Neoformat
" https://github.com/sbdchd/neoformat
" ##############################################################################

let g:neoformat_python_prettydiff = {
      \ 'exe': 'prettydiff',
      \ 'args': [
      \ 'mode:"beautify"',
      \ 'commline:"true"',
      \ 'cssinsertlines:"true"',
      \ 'insize:"2"',
      \ 'preserve:"0"',
      \ 'wrap:"0"',
      \ 'braceline:"true"',
      \ 'methodchain:"chain"',
      \ 'summaryonly:"true"',
      \ 'tagmerge:"false"',
      \ 'spaceclose:"true"',
      \ 'noleadzero:"true"',
      \ 'html:"true"',
      \ 'styleguide:"grunt"',
      \ 'space:"false"',
      \ ],
      \ }

let g:neoformat_enabled_prettydiff = ['prettydiff']

let g:neoformat_verbose = 1
