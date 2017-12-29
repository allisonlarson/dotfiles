set nocompatible                " choose no compatibility with legacy vi

" lets get ready to vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'archseer/colibri.vim'
Plugin 'allisonlarson/todo-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-endwise'
Plugin 'fatih/vim-go'
call vundle#end()

" done vundling, load file type plugins + indentation
filetype plugin indent on

set rtp+=/usr/local/go/misc/vim

"" specify regex engine
set re=1
"" speed up scroll
set ttyfast

" tmux terminal true colors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors

set background=dark
colorscheme colibri
let g:airline_theme='princess'
" Fix paren/bracket highlighting
hi MatchParen ctermbg=bg guibg=bg ctermfg=215 guifg=#EFBA5D

syntax enable
set encoding=utf-8

" display incomplete commands
set showcmd

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cursor_column = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching


if $TMUX == ''
  set clipboard+=unnamed
endif
set nobackup                                        " no backup files
set nowritebackup                                   " only in case you don't want a backup file while editing
set noswapfile                                      " no swap files
set scrolloff=4                                     " adds top/bottom buffer between cursor and window
set cursorline                                      " colours the line the cursor is on
set number                                          " line numbers

let mapleader = "\<Space>"
imap jk <Esc>

" pry insertion
nmap <Leader>p orequire "pry-byebug"; binding.pry<ESC>;
" debugger insertion
nmap <Leader>d odebugger<ESC>;
" in visual mode, "." will for each line, go into normal mode and execute the "."
vnoremap . :norm.<CR>

autocmd BufWritePre * :%s/\s\+$//e

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" buffer navigation
let g:airline#extensions#tabline#enabled = 1            " Enable list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'        " Show just the filename
set hidden                                              " hides modified buffers
" open new empty buffer
nmap <leader>T :enew<cr>
" move to next buffer
nmap <leader>l :bnext<CR>
" move to previous buffer
nmap <leader>h :bprevious<CR>
" close buffer, move to previous
nmap <leader>bq :bp <BAR> bd #<CR>
" show open buffers & their status
nmap <leader>bl :ls<CR>

" map \ to the :Ag command
nnoremap \ :Ag<SPACE>
" Expand current word & search dir
map <leader>a :execute "Ag " . expand("<cword>") <CR>
" Surrounds selection with ()
xnoremap <leader>s xi()<Esc>P
" Surrounds selection with []
xnoremap <leader>b xi[]<Esc>P
" Surrounds selection with {}
xnoremap <leader>c xi{}<Esc>P
" Surrounds selection with
xnoremap <leader>q xi""<Esc>P

map <leader>o :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<cr>

"Finding files
set path+=**
set wildmenu
