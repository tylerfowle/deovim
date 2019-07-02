" ##############################################################################
" NERDTree
" https://github.com/scrooloose/nerdtree
" ##############################################################################

map <C-n> :NERDTreeToggle<CR><c-w>=
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'
" Disable bookmarks label, and hint about '?'
let NERDTreeMinimalUI=1
" colorize full name in addition to icon
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeIgnore = ['\.DS_Store$','node_modules','*.pyc','\~$']
