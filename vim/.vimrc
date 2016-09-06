execute pathogen#infect()

set rtp+=/usr/local/go/misc/vim

colorscheme gruvbox
set background=dark
set term=screen-256color

"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Syntax Highlighting
let g:jsx_ext_required = 0

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

"" ========== NERDTree  ==========
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if NERDTree is the only open buffer

"" ==========  Mine  ==========
set clipboard=unnamed
set nobackup                                        " no backup files
set nowritebackup                                   " only in case you don't want a backup file while editing
set noswapfile                                      " no swap files
set scrolloff=4                                     " adds top/bottom buffer between cursor and window
set cursorline                                      " colours the line the cursor is on
set number                                          " line numbers
let mapleader = "\<Space>"
nmap <Leader>p orequire "byebug"; byebug<ESC>;  " pry insertion
nmap <Leader>d odebugger<ESC>;                      " debugger insertion
vnoremap . :norm.<CR>                               " in visual mode, "." will for each line, go into normal mode and execute the "."
autocmd BufWritePre * :%s/\s\+$//e
imap jk <Esc>
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_use_caching = 0

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" buffer navigation
let g:airline#extensions#tabline#enabled = 1            " Enable list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'        " Show just the filename
set hidden                                              " hides modified buffers
nmap <leader>T :enew<cr>                                " open new empty buffer
nmap <leader>l :bnext<CR>                               " move to next buffer
nmap <leader>h :bprevious<CR>                           " move to previous buffer
nmap <leader>bq :bp <BAR> bd #<CR>                      " close buffer, move to previous
nmap <leader>bl :ls<CR>                                 " show open buffers & their status

" map \ to the :Ag command
nnoremap \ :Ag<SPACE>
map <leader>a :execute "Ag " . expand("<cword>") <CR>   " Expand current word & search dir

xnoremap <leader>s xi()<Esc>P                           " Surrounds selection with ()
xnoremap <leader>b xi[]<Esc>P                           " Surrounds selection with []
xnoremap <leader>c xi{}<Esc>P                           " Surrounds selection with {}
xnoremap <leader>q xi""<Esc>P                           " Surrounds selection with ""
