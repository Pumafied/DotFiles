call pathogen#infect()
colorscheme sweyla751738

filetype plugin on

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
nmap <F6> :set list!<CR>
nmap <F7> :set linebreak<CR>
nmap <F9> :SyntasticToggleMode<CR>
nmap <F12> :set spell!<CR>

"This makes vim splits easier to use
nmap <leader>aa :topleft  vnew<CR>
nmap <leader>dd :botright vnew<CR>
nmap <leader>ww :topleft  new<CR>
nmap <leader>ss :botright new<CR>
"Zen coding expand key
let g:user_zen_expandabbr_key = '<c-e>'

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>ew :e ...
map <leader>ew :sp ...
map <leader>ew :vsp ...
map <leader>et :tabe ...

"-----------------End of Keybindings---------------------"
"--------------Internal settings-----------"

"Turns on syntax highlighting
sy on

"Sets no back to remove annoying backup files
set nobackup
set noswapfile

"Change history to 1000
set history=10000

set hidden

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
set nofoldenable
set listchars=tab:▸\ ,eol:¬

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

"fancy
"let g:Powerline_symbols = 'fancy'

"Undo settings
set undodir=~/.vimundo
set undofile
set undolevels=1000
set undoreload=10000

"When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set formatoptions+=1

set relativenumber

filetype plugin indent on

" faster redrawing
set ttyfast

"For use with vim gutter
highlight clear SignColumn

" enhanced command line completion
set wildmenu

set nolazyredraw " don't redraw while executing macros

set laststatus=2 " show the status line all the time
"Auto strips trailing white spaces
if has("autocmd")
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif
"----------End UI Settings----------------"
"----------Functions-------------"

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
