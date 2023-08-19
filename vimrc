"vim: set filetype=sh :
syntax on 
set spell spelllang=en_us
set ruler
set autochdir 
set mouse=a
set noerrorbells "no sound effects
set visualbell 
filetype indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmenu
set wildmode=list:longest,full
set smartindent
set rnu relativenumber " relative line number
set nowrap
set smartcase 
set noswapfile "no swap file (vim creates them by default) 
set nobackup "no backup file
set undodir=~/.nvim/undodir
set undofile
set cursorline
set incsearch
set formatoptions-=cro
set background=dark
set title
set ignorecase
set nocompatible   
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'julialang/julia-vim'
Plugin 'kyoz/purify'
Plugin 'bakpakin/janet.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tcomment_vim'
Plugin 'ciaranm/inkpot'
Plugin 'sainnhe/sonokai'
Plugin 'arcticicestudio/nord-vim'
Plugin 'tbastos/vim-lua'
"Plugin 'vim-syntastic/syntastic'
Plugin 'AutumnLeaf'
Plugin 'nanotech/jellybeans.vim'
"CSS properties and color selector
Plugin 'ps173/dadara'
Plugin 'gruvbox-community/gruvbox'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'dracula/vim', { 'as': 'dracula' }
"CSS properties and color selector
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'sheerun/vim-polyglot'
" File explorer
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
" Intellisense and code completion with syntax highlighting
Plugin 'preservim/nerdcommenter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set encoding=UTF-8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
" NERD TREE AND ICONS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusline='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" File explorer plugin
map <C-b> :NERDTreeToggle<CR>
" nerd commenter
noremap <leader>c :NERDCommenterComment<CR>
set guifont=DroidSansMono_Nerd_Font:h11

colorscheme habamax
set lispwords+=!
set lispwords+=geta
set lispwords+=is
set lispwords+=defact
set lispwords+=loop

set spellsuggest=fast,1 "Don't show too much suggestion for spell check
nn <F7> :setlocal spell! spell?<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeCustomOpenArgs = {'file':{'where':'t'}}

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE
"nnoremap <silent> <C-l> :nohl<CR><C-l>

 if has('wildmenu')
   set wildmenu
   if exists('+wildmode')
     set wildmode=longest:full,full
   endif
   set wildcharm=<C-Z>
   map <F10> :emenu <C-Z>
   imap <F10> <C-O>:emenu <C-Z>
   if !has('gui_running')
     runtime! menu.vim
   endif " !has('gui_running')
 endif " 'wildmenu'
