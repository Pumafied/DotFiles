call pathogen#infect()
colorscheme sweyla751738

"Enables mouse support
set mouse =a

"-------------Key Bindings---------------"

"Sets the leader char to comma 
let mapleader = ","

"edit ~/.vimrc
map <leader>e :e! ~/.vimrc<cr>

"Write a file with sudo privledges
cmap w!! w !sudo tee % >/dev/null

"Toggles wrapping
nmap <F2> :set paste!<CR>
"enable nerd tree toggle
nmap <F3> :NERDTreeToggle<CR>
"Turns off the highlighting in the source
nmap <F4> :set hlsearch!<CR>
"Toggles text wrapping for use with large arrays
nmap <F5> :set wrap!<CR>
nmap <F12> :set spell!<CR>

"This makes vim splits easier to use
nmap <leader>aa :topleft  vnew<CR>
nmap <leader>dd :botright vnew<CR>
nmap <leader>ww :topleft  new<CR>
nmap <leader>ss :botright new<CR>

"-----------------End of Keybindings---------------------"
"--------------Internal settings-----------"

"Turns on syntax highlighting
sy on

"Sets no back to remove annoying backup files
set nobackup
set noswapfile

"Change history to 1000
set history=10000

"Tab control
set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"Auto writes all when focues is lost
autocmd BufLeave,FocusLost * silent! wall

"Removes compatibility with vi
set nocompatible 

" make backspace behave in a sane manner
set backspace=indent,eol,start

"----------End Internal Settings----------"
"----------UI settings---------------"

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"Undo settings 
set undodir=~/vimundo
set undofile
set undolevels=1000
set undoreload=10000

"When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set formatoptions+=1 

set relativenumber

filetype plugin indent on

" faster redrawing
set ttyfast

" enhanced command line completion
set wildmenu 

set nolazyredraw " don't redraw while executing macros

set laststatus=2 " show the status line all the time
"----------End UI Settings----------------"
