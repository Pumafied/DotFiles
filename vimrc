call pathogen#infect()
colorscheme sweyla751738

"TODO Bind capital q and capital w to the lower case forms of it 

set mouse =a

"Sets no back to remove annoying backup files
set nobackup

"Sets the leader char to comma 

let mapleader = ","
"Removes compatibility with vi
set nocompatible 

set relativenumber

"Adds persistant macros
"let @z = 

"Toggles wrapping
nmap <F5> :set wrap!<CR>
nmap <F2> :set paste!<CR>
nmap <F12> :set spell!<CR>

"Turns on syntax highlighting
sy on

filetype plugin indent on

"This makes vim splits easier to use
"window
nmap <leader>aa  :topleft  vnew<CR>
nmap <leader>dd :botright vnew<CR>
nmap <leader>ww    :topleft  new<CR>
nmap <leader>ss  :botright new<CR>

" buffer
nmap <leader>sa   :leftabove  vnew<CR>
nmap <leader>sd  :rightbelow vnew<CR>
nmap <leader>sw    :leftabove  new<CR>
nmap <leader>sf   :rightbelow new<CR>

"Todo disable arrow keys only when in command mode

" make backspace behave in a sane manner
set backspace=indent,eol,start

" change history to 1000
set history=10000

"This disables the swap file storage
set noswapfile

"enable nerd tree toggle
nmap <F3> :NERDTreeToggle<CR>
" Tab control
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" faster redrawing
set ttyfast

set wildmenu " enhanced command line completion

set nolazyredraw " don't redraw while executing macros

set noswapfile

set laststatus=2 " show the satus line all the time

" edit ~/.vimrc
map <leader>e :e! ~/.vimrc<cr>

"Turns off the highlighting in the source
nmap <F4> :set hlsearch!<CR>
