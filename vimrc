call pathogen#infect()

"Enables mouse support
set mouse =a
"Removes compatibility with vi
set nocompatible

" These may be combined for brevity (disabling both)
filetype plugin indent off
set list
set tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
set ignorecase
set smartcase

"------------- Vim WIKI Key Bindings---------------"
" For the Split Eventually add a split the other way

"-------------Key Bindings---------------"

"Check for mac updated
"softwareupdate -l
"Install all availible updates mac
"softwareupdate -i -a

set number
"Sets the leader char to comma
let mapleader = ","
nmap <leader>l <Plug>VimwikiSplitLink
set synmaxcol=0
"edit ~/.vimrc
map <leader>e :e! ~/.vimrc<cr>

"Write a file with sudo privledges after having opened the file without them
cmap w!! w !sudo tee % >/dev/null

"Toggles wrapping
nmap <F2> :set paste!<CR>
"enable nerd tree toggle
nmap <F3> :NERDTreeToggle<CR>
"Turns off the highlighting in the source
nmap <F4> :set hlsearch!<CR>
nmap <F6> :set list!<CR>
nmap <F7> :set linebreak<CR>
nmap <F9> :SyntasticToggleMode<CR>
nmap <F12> :set spell!<CR>

"This makes vim splits easier to use
nmap <leader>aa :topleft  vnew<CR>
nmap <leader>dd :botright vnew<CR>
"Commented out so that I can use vim wiki
"nmap <leader>ww :topleft  new<CR>
nmap <leader>ss :botright new<CR>
"Zen coding expand key
let g:user_zen_expandabbr_key = '<c-e>'


"Allows for moving across splits easily
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"map <C-a> <esc>
"
map <leader>ew :e ...
map <leader>ew :sp ...
map <leader>ew :vsp ...
map <leader>et :tabe ...

nmap <leader>v :vsp $MYVIMRC<CR>

"Tab movement
nmap <leader>o :tabn<CR>
nmap <leader>p :tabp <CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

nmap gV `[v`]


"-----------------End of Keybindings---------------------"
"--------------Internal settings-----------"

"Turns on syntax highlighting
sy on

"Change history to 1000
set history=10000

set hidden

"set directory=~/.vim/swap
"set backupdir=~/.vim/backup


set shortmess=aTItoO


"Tab control
"set smarttab
"set expandtab
"set shiftwidth=2
"set tabstop=2
"set softtabstop=2

"set noexpandtab
"Auto writes all when focus is lost
autocmd BufLeave,FocusLost * silent! wall


" make backspace behave in a sane manner
set backspace=indent,eol,start

"----------End Internal Settings----------"
"----------UI settings---------------"


"Sets the language to US English
set spelllang=en_us

"Solorized settings
syntax enable
set background=dark
colorscheme solarized
set cursorline

"This colors your curently active line for reading. Not necessary if you use
"solorazied
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"Old theme
"colorscheme sweyla751738

"Removes the ability to fold over code
set nofoldenable
"Makes invisible characters easier to see
set listchars=tab:▸\ ,eol:¬

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove tool bar
set guioptions-=r  "remove right-hand scroll bar

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

"set terminal title
set title

" don't redraw while executing macros
set nolazyredraw

" enhanced command line completion
set wildmenu

set nolazyredraw " don't redraw while executing macros

set laststatus=2 " show the status line all the time

"Auto strips trailing white spaces on write
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

