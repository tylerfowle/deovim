" Tyler Fowle
" DOTFILES

source /root/.config/nvim/vim/config/autocommands.vimrc
source /root/.config/nvim/vim/config/functions.vimrc
source /root/.config/nvim/vim/config/filetypes.vimrc

" Vars {{{

" Leader keys
let mapleader = ','
let maplocalleader = ';'

" set a global var for custom bg color
let g:tf_background="#202020"
let g:tf_cursorline="#35312f"

" }}}


" General Config {{{

syntax enable             " enable syntax processing
filetype plugin on        " load filetype-specific indent files
filetype indent on
set encoding=utf8         " set encoding
set t_Co=256              " explicitly tell vim that the terminal supports 256 colors
set ttyfast               " faster redrawing
set tags=tags;            " set tags location
set iskeyword+=-          " include - in keyword matching

" }}}


" Session settings {{{

set sessionoptions-=blank
set sessionoptions-=folds
set sessionoptions-=help
set sessionoptions-=buffers

" }}}


" Spaces & Tabs {{{

set tabstop=4             " number of visual spaces per TAB
set shiftwidth=4          " number of spaces to use for indent and unindent
set expandtab             " tabs are spaces

" }}}


" UI {{{

set nowrap                     " dont wrap long lines
set hidden                     " hide buffers, dont unload them, this fixes losing syntax on buffer change
set number                     " show line numbers
set relativenumber             " use relative lines
set title                      " show file name in window title
set scrolloff=5                " keep the cursorline 5 lines away from top and bottom of screen
set cursorline                 " highlight line with cursor
set showmatch                  " show matching brackets
set matchpairs+=<:>            " make < and > match as well
set mouse=a                    " enable mouse for scrolling
set showcmd                    " show current command in bottom right
set laststatus=2               " always show airline
set wildmenu                   " visual autocomplete for command menu
set wildcharm=<TAB>            " auto completetion hotkey
set wildignore+=node_modules/* " ignore node modules
set list                       " show invisible characters
set listchars=tab:→\ ,trail:⋅  " list chars
set fillchars=vert:│           " set vert split character to taller line

" }}}


" Splits {{{

set splitbelow   " open new splits to bottom
set splitright   " open new splits to right

" }}}


" Searching {{{

set ignorecase   " ignore case in search patterns
set smartcase    " override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch    " search as characters are entered
set hlsearch     " highlight matches

" }}}


" Indenting {{{

set autoindent   " automatically set indent of new line
set smartindent  " do smart autoindenting when starting a new line

" }}}


" Folding {{{

set foldenable        " enable folding
set foldmethod=indent " fold based on indent level
set foldlevel=10      " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldclose=all

" }}}


" Misc {{{

set autoread         " auto reload changed files
set modelines=1      " check the last line for file specific settings

set path+=build/scss " for searching
set path+=./*-website-*/**/ " for searching
set path+=app/assets/**/* " for searching
set path+=./**/


" }}}


" Filetype {{{

let g:python_highlight_all = 1

" }}}


" netrw {{{

let g:netrw_gx="<cWORD>"   " use whole words when opening URLs.
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_winsize = 25

" }}}


" imports {{{
"
source /root/.config/nvim/vim/plugins/airline.vimrc
source /root/.config/nvim/vim/plugins/ale.vimrc
source /root/.config/nvim/vim/plugins/coc.vimrc
source /root/.config/nvim/vim/plugins/delimitmate.vimrc
source /root/.config/nvim/vim/plugins/gitgutter.vimrc
source /root/.config/nvim/vim/plugins/indent-guides.vimrc
source /root/.config/nvim/vim/plugins/jedi.vimrc
source /root/.config/nvim/vim/plugins/neoformat.vimrc
source /root/.config/nvim/vim/plugins/supertab.vimrc
source /root/.config/nvim/vim/plugins/tagbar.vimrc
source /root/.config/nvim/vim/plugins/ultisnips.vimrc
source /root/.config/nvim/vim/plugins/vim-partial.vimrc
source /root/.config/nvim/vim/plugins/vista.vimrc

" leader keys
source /root/.config/nvim/vim/keymaps/general.vimrc
source /root/.config/nvim/vim/keymaps/leader.vimrc
source /root/.config/nvim/vim/keymaps/terminal.vimrc

" }}}


" colorscheme {{{

set background=dark

if has('termguicolors')
  set termguicolors " 24-bit terminal
endif

" set gruvbox as theme
colorscheme gruvbox

" set custom background color
if has('nvim')
  hi Normal guibg=g:tf_background
  hi SignColumn guibg=g:tf_background
  hi Folded guibg=g:tf_background
  hi CursorLine guibg=g:tf_cursorline
  " customize matching paren colors
  hi MatchParen guifg=#000000 guibg=#fc802d
endif

" limelight colors
let g:limelight_conceal_ctermfg = '#555555'
let g:limelight_conceal_guifg = '#555555'

" }}}


" markdown highlight syntax overrides {{{

hi! link htmlH1 GruvboxGreenBold
hi! link htmlH2 GruvboxPurpleBold
hi! link htmlH3 GruvboxAquaBold
hi! link htmlH4 GruvboxYellowBold
hi! link htmlH5 GruvboxOrangeBold
hi! link htmlH6 GruvboxRedBold

" }}}

" custom markdown highlighting
au FileType markdown :silent! call matchadd('GruvboxGreenBold', 'DONE')
au FileType markdown :silent! call matchadd('GruvboxYellowBold', 'TODO')

" Abbreviations {{{

abbr marign margin
abbr widht width
abbr iamges images
abbr iamge image
abbr sectoin section
abbr accordian accordion

" }}}
