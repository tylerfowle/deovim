" ##############################################################################
" Plugins
" https://github.com/junegunn/vim-plug
" ##############################################################################

call plug#begin('~/.vim/plugged')

" Colorscheme {{{

Plug 'morhetz/gruvbox'
Plug 'srcery-colors/srcery-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" }}}

" UI {{{

Plug 'nathanaelkane/vim-indent-guides', {'on': ['IndentGuidesToggle','IndentGuidesOn']} " indent guides
Plug 'vim-airline/vim-airline'                                                          " fancy statusline
Plug 'vim-airline/vim-airline-themes'                                                   " themes for airline
Plug 'airblade/vim-gitgutter'                                                           " Shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'junegunn/vim-peekaboo'                                                            " shows registers in a sidebar
Plug 'junegunn/limelight.vim', {'on': ['Limelight', 'Limelight!!']}                     " dim paragraphs above and below

" }}}

" Utilities {{{

Plug 'ton/vim-bufsurf'                                       " Navigate buffers based on history, like browser windows
Plug 'junegunn/vim-easy-align'                               " ga to align by character
Plug 'tpope/vim-repeat'                                      " enables repeating other supported plugins with the . command
Plug 'tpope/vim-surround'                                    " ysiw to surround word
Plug 'tpope/vim-commentary'                                  " easy commenting
Plug 'tpope/vim-fugitive'                                    " git wrapper
Plug 'tpope/vim-rhubarb'                                     " github extension for fugitive
Plug 'tpope/vim-ragtag'                                      " html mappings
Plug 'bronson/vim-trailing-whitespace'                       " This plugin causes all trailing whitespace to be highlighted in red.
Plug 'google/vim-searchindex'                                " show search position among all results
Plug 'markonm/traces.vim'                                    " highlight patterns and ranges for Ex commands
Plug 'triglav/vim-visual-increment'                          " use ctrl a/v to increment.decrement a visually selected block
Plug 'mileszs/ack.vim'                                       " ack for vim - replaces vimgrep
Plug 'brooth/far.vim'                                        " find and replace with :Far foo bar **/*.scss -then- :Fardo
Plug 'wakatime/vim-wakatime'                                 " time tracker
Plug 'AndrewRadev/switch.vim'                                " switch boolean values with gs
Plug 'vim-scripts/TaskList.vim', {'on': 'TaskList'}          " tasks list: todo:, note:, fixme:
Plug 'jbgutierrez/vim-partial'                               " makes creating partial files easy: <leader>x in visual mode
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'} " intellisense completion
Plug 'liuchengxu/vista.vim'                                  " tagbar replacer

if has('nvim')
  Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}               " use nvim to type in chrome, require chrome plugin: https://chrome.google.com/webstore/detail/ghosttext/godiecgffnchndlihlpaajjcplehddca
  Plug 'floobits/floobits-neovim', {'on': ['FlooJoinWorkspace']} " floobits - collaborative editing
endif

" }}}

" Syntax Engines {{{

Plug 'w0rp/ale'          " linting and fixing
Plug 'sbdchd/neoformat'  " formatter

" }}}

" Syntax support {{{

Plug 'othree/html5.vim'                                                 " html5 syntax
Plug 'othree/javascript-libraries-syntax.vim'                           " javascript libary syntax (jquery)
Plug 'pangloss/vim-javascript'                                          " javascript syntax
Plug 'JulesWang/css.vim'                                                " css syntax
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss','sass']}              " scss syntax
Plug 'lumiliet/vim-twig', {'for': ['html.twig']}                        " twig syntax
Plug 'vim-ruby/vim-ruby'                                                " ruby syntax
Plug 'tpope/vim-rails'                                                  " rails
Plug 'godlygeek/tabular'                                                " alignment - vim-markdown says it needs it
Plug 'plasticboy/vim-markdown', {'for': ['markdown','md']}              " markdown syntax
Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown','md']}             " markdown - generate table of contents with :GenTocGFM
Plug 'shime/vim-livedown', {'on': ['LivedownPreview','LivedownToggle']} " live markdown preview 'npm install -g livedown
Plug 'mustache/vim-mustache-handlebars'                                 " mustache syntax
Plug 'posva/vim-vue'                                                    " vue syntax
Plug 'StanAngeloff/php.vim'                                             " php syntax
" Plug 'kchmck/vim-coffee-script'                                         " coffeescript syntax
" Plug 'jwalton512/vim-blade'                                             " blade syntax
" Plug 'posva/vim-vue'                                                    " vuejs syntax
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                      " go

" }}}

" Auto Complete {{{

Plug 'ervandew/supertab'                                                                     " Perform all your vim insert mode completions with Tab

" }}}

" Snippets {{{

Plug 'mattn/emmet-vim'                                                                       " html / templates
Plug 'sirver/ultisnips'                                                                      " snippet engine
Plug 'honza/vim-snippets'                                                                    " collection of snippets

" }}}


call plug#end()
