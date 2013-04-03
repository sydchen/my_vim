set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'ctrlp.vim'
Bundle 'bufexplorer.zip'
Bundle 'matchit.zip'
Bundle 'ruby-matchit'
Bundle 'fugitive.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'snipMate'
Bundle 'epmatsw/ag.vim'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'ervandew/supertab.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'maxbrunsfeld/vim-yankstack'
" Bundle 'The-NERD-Commenter'
" Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-markdown.git'
Bundle 'sydchen/tslime.vim.git'
Bundle 'sydchen/tslime.vim'
Bundle 'vim-scripts/closetag.vim'

set fileencodings=utf-8,big5,gbk,euc-jp,euc-kr,utf-bom,iso8859-1
set fileencoding=utf8
set encoding=utf8 
set termencoding=utf8

set nu
set tabstop=4
set shiftwidth=4
set expandtab           "set et, expandtab,expand tab with space 
set smartindent
set showcmd
set ic                  "ignore case
syntax on
set hlsearch
set t_Co=256
set bs=2
set cursorline
colorscheme jellybeans
"colorscheme Tomorrow-Night

"status at right bottom corner
set ruler

"turn off expandtab for editing makefiles
autocmd FileType make setlocal noexpandtab
"autocmd FileType eruby colorscheme railscasts
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType ruby setlocal tabstop=2
let do_syntax_sel_menu=1


" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" tab control
map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>

nmap gf :tabedit <cfile><CR>

" buffer control
nmap <C-h> :bprev!<CR>
nmap <C-l> :bnext!<CR>
nmap <F4> :bd<CR>

nmap <F2> :NERDTreeToggle<CR> 
nmap <F3> :set invpaste<CR> 

"FuzzyFinder
nnoremap <silent> fb     :FufBuffer<CR>
nnoremap <silent> ff     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> fc     :FufFile config/<CR>
nnoremap <silent> fv     :FufFile app/views/<CR>
nnoremap <silent> fj     :FufFile app/assets/javascripts/<CR>
nnoremap <silent> fs     :FufFile app/assets/stylesheets/<CR>

"tabpage display
hi TabLineFill ctermfg=black
hi TabLine     ctermfg=white ctermbg=black
hi TabLineSel  ctermfg=white ctermbg=darkred
hi Search     ctermfg=black     ctermbg=Yellow

"Autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

fun! Global_symbol()
    let wordUnderCursor = expand("<cword>")
    :exe ":Gtags -x ".wordUnderCursor
endfun

fun! Global_reference_symbol()
    let wordUnderCursor = expand("<cword>")
    :exe ":Gtags -x -r ".wordUnderCursor
endfun

"map gt :call Global_symbol()<CR>
map gr :call Global_reference_symbol()<CR>

set laststatus=2

filetype on
filetype plugin on
set nocp 

"trim spaces at the end of lines 
vnoremap ts :s/\s\+$//<CR>
nnoremap ts :%s/\s\+$//<CR>

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

" CtrlP
" map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gr :tabe config/routes.rb<cr>
map <leader>gg :tabe Gemfile<cr>

map <leader>t :call Send_to_Tmux("be rspec ".expand("%")."\n")<CR>
map <leader>s :call Send_to_Tmux("be rspec ".expand("%").":".line(".")."\n")<CR>

" tag jump
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

