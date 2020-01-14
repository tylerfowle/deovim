" Leader Shortcuts {{{

" open _settings.scss
" nnoremap <localleader>s 100<C-w>l:vsplit<cr>:set wfw<cr>:vertical resize 80<cr>:find **/_settings.scss<cr>
nnoremap <localleader>s :silent !stylelint --fix %<cr>

" time snips
nmap <leader>dt :r !date "+\%a \%b \%d \%Y"<cr>I##<space><esc>o<esc>
nmap <leader>dd :r !date "+\%a \%b \%d \%Y"<cr>I##<space><esc>o<esc><leader>dnin<tab><esc>o11:30 \| ⬆ lunch<esc>:Tabularize /\|<cr>j
nmap <leader>dn :r !date +"\%T"<cr>A<space>\|<space>
nmap <leader>td }j"zyt {k"xyt j:r !timediff <c-r>z <c-r>x<cr> A \| Total<esc>
nmap <leader>tc }j"zyt {k"xyt j:r !timecalc <c-r>z <c-r>x<cr> A \| Total<esc>

" Tabularize
nnoremap <leader>t :Tabularize /\|
vnoremap <leader>t :Tabularize /\|

" enable folding
nnoremap <localleader><space> za

" limelight toggle
nnoremap <localleader>l :Limelight!!<cr>

"background toggle light and dark
map <localleader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" toggle refresh-chrome
let g:rchrome=1
nnoremap <localleader>rc :silent! let rchrome = ( rchrome == 1? 0 : 1 )<CR>:echo rchrome<cr>
nnoremap <localleader>rr :silent! !refresh-chrome<cr>

" Jump to next/previous warning/error
nnoremap <localleader>n :ALENext<CR>
nnoremap <localleader>h :ALEPrevious<CR>

" Livedown - markdown preview {{{
nnoremap <localleader>m :LivedownPreview<CR>
let g:instant_markdown_autostart = 1
" }}}

" Quickfix {{{
nnoremap <localleader>j :cn<CR>
nnoremap <localleader>k :cp<CR>
" }}}

" Python execution in neovim {{{
" nnoremap <leader>gp :vsp<CR>:term python2 %<CR>
nnoremap <leader>e :ExecPython<cr>
" }}}

" Ale maps {{{
nnoremap <leader>gf :ALEFix<cr>
" }}}

" Prettydiff
nnoremap <localleader>f :PrettyDiff<cr>

" Vista window
nnoremap <localleader>v :Vista!!<cr>

" create file under from path under cursor relative to current buffer
nnoremap <silent> <leader>cf :e <cfile>.scss<CR>
nnoremap <localleader>cf :e <cfile><CR>

" tagbar toggle
nnoremap <leader>tt :TagbarToggle<CR>

" :Ack - find in all
" trailing space is intentional!
nnoremap <leader>gg :Ack 

" turtle.vim comment header
nnoremap <leader>ch :Commentr<CR>

" prompt to do math on word
nnoremap <leader>c viwxi<C-R>=<C-R>"
" with visual selection, do math
vnoremap <leader>c xi<C-R>=<C-R>"<CR>

" toggle between maximized pane, and all equal panes
nnoremap <leader>m :call ToggleMaximizedSplit()<CR>

" sassvars
nnoremap <leader>gs :e sassvars.scss<CR>:r !grep -Rh "\$\S*:" ./**/*.scss<CR>:noh<CR>

" quick quit all
nnoremap <leader>q :qa<CR>

" shortcut to save
nmap <leader>, :w<CR>

" open current dir in finder
nmap <leader>o :silent! !open .<CR>
nmap <leader>oo :silent! !code .<CR>

" run savesite in current dir
nmap <silent> <leader>k :silent !savesite<CR> :redraw!<cr>

" super save - save session in its current state, open agian with `vim -S`
nnoremap <leader>s :mksession!<CR>

" clear highlighted search term, but keep in register
nnoremap <leader><esc> :noh<CR>

" select all and copy to clipboard
nmap <leader>a :%y+<CR>


" Buffer navigation like a browser
if !empty(glob("~/.dotfiles/vim.symlink/plugged/vim-bufsurf/plugin/bufsurf.vim"))
    noremap <leader>z :BufSurfBack<CR>
    noremap <leader>x :BufSurfForward<CR>
else
    noremap <leader>z :bp<CR>
    noremap <leader>x :bn<CR>
endif

" toggle sidebar
nnoremap <leader>; :SideBarEnterToggle<CR>

" tab stuff
" create new tab
noremap <C-t> :tabe<CR>
noremap gr gT

" close current buffer but not current window
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" close all buffers except the current
nnoremap <leader>bc :%bd<bar>e#<CR>

" reload vimrc file
nnoremap <leader>! :so $MYVIMRC<CR>

" reindent entire buffer
" mark cursor and put cursor back, center cursor in window
nnoremap <leader>r magg=G`azz

" move 1 line up from cursor to beginning of paragraph
" move 1 line down from cursor to end of paragraph
nnoremap gp makdd{p`ajdd}P=ip`a

" compress multiple new lines into a single new line
nnoremap <leader>cl :v_._,/./-j<CR>:noh<CR>

" mark cursor, close buffer, create new pane, open mark
nnoremap <leader>gt mAZZ<C-w>v`A

" leader w, for pane control
nnoremap <leader>w <C-w>
" focus splits with ctrl + direction
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open file under cursor in vertical split
nnoremap <leader>wf :vertical wincmd f<CR>

" Display current file in the NERDTree ont the left
" nmap <silent> <leader>n :NERDTreeFind<CR><c-w>=
" map <C-n> :NERDTreeToggle<CR><c-w>=

" oped v split
nmap <leader>v :vsp<CR>

" }}}
"

" Text Objects {{{
" in variable text object, includes $ before word
vnoremap iv :<C-U>silent! normal! bbve<CR>
onoremap iv :silent! normal bbve<CR>
" }}}

" Tag Shortcuts {{{

nnoremap tg :silent ! ctags -R --languages=ruby,scss --exclude=.git --exclude=log .<cr>
" search tag under cursor
nnoremap tt <c-]>zz
" go back to definition
nnoremap tb <c-t>
" go to next tag
nnoremap tn :tn<CR>
" go to previous tag
nnoremap tp :tp<CR>
" }}}


