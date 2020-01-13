" ##############################################################################
" ALE
" https://github.com/w0rp/ale
" ##############################################################################

let b:ale_linters = {
      \ 'bash': ['shellcheck'],
      \ 'python': ['flake8'],
      \ 'php': ['phpcs']
      \ }

let g:ale_fixers = {
      \ '*': [
      \ 'remove_trailing_lines',
      \ 'trim_whitespace',
      \ ]
      \ }

let b:ale_fixers = {
      \ 'python': [
      \ 'add_blank_lines_for_python_control_statements',
      \ 'black',
      \ 'remove_trailing_lines',
      \ 'trim_whitespace',
      \ 'isort',
      \ 'yapf',
      \ 'phpcbf'
      \ ]
      \ }
