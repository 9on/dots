" vim:fdm=marker

" Color {{{
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1 "nuevo en neovim** (pero fail)
"set t_Co=256
"set nocompatible               " be iMproved
colorscheme molokai
"let g:molokai_original = 1
let g:rehash256 = 1 "ayuda a que molokai se acerque mas al original en term256
"}}}

" Random {{{
" hack para esconder el buffer vimfiler:default de la lista de buffers
" fuente: http://stackoverflow.com/a/6821698
autocmd VimEnter * VimFilerExplorer
autocmd VimEnter * VimFilerExplorer
" set wildignore+=*.spec.js

"https://github.com/neovim/neovim/issues/2017#issuecomment-75223935
"aunque me bastó con setear tmux escape-time 0, tarruda dice que esto tambien
"ayuda
set ttimeoutlen=-1 "arregla el escape con tmux

" }}}

" Binds de sanidad {{{
nnoremap Q q
nnoremap q <Esc>
map <F1> <NOP>
"}}}

"Configuracion general {{{
syntax on
" set fillchars+=stl:\ ,stlnc:\
set nu                  "numeros de linea
set ignorecase          "busqueda case insensitive
" set list "muestra unprintable chars con ^ y pone $ despues de la linea
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set hidden              " Permite cambiar de buffer sin tener que haber guardado el actual

" tabs para distitnos archivos:
" by default, the indent is 2 spaces. 
set expandtab           "tabs son espacios (no caracter tab)
set tabstop=4           "ident char de ancho 4 columnas
set shiftwidth=4	    "identacion de 4 espacios (pep8)
set softtabstop=4       "backspace

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype jade setlocal ts=2 sw=2 sts=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab

set backspace=2 " make backspace work like most other apps

"maps personales
let mapleader=';'

" performance http://stackoverflow.com/a/7187629
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

" gv
" :set go+=c "to kill popup dialogs

" more natural stuff
set splitbelow
set splitright
"}}}

" Laders y binds {{{
nmap <leader>q :q<CR>
nmap <leader>s :w<CR>
nmap qn :bnext<CR>
nmap qb :bprevious<CR>
nmap qN :bprevious<CR>

" GO TO rules
nmap gl :wincmd l<CR>
nmap gh :wincmd h<CR>
nmap sa :wa<CR>
nmap ss :w<CR>

"}}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
    let g:vimwiki_table_mappings=0
if has('nvim')
else
    Plug 'Shougo/vimproc.vim'
endif
Plug 'Shougo/unite.vim'
    " unite config{{{
    if has('nvim')
        nnoremap <leader>r :Unite file_rec/neovim<CR>
        nnoremap <C-o> :Unite -start-insert file_rec/neovim<cr>
    else
        nnoremap <leader>r :Unite file_rec/async<CR>
        nnoremap <C-o> :Unite -start-insert file_rec/async<cr>
    endif
    nnoremap <leader>a <Plug>(unite_redraw)
    nnoremap <leader>z <Plug>(unite_print_message_log)
    nnoremap gb :Unite buffer<cr>
    nnoremap <leader>b :Unite -start-insert buffer<cr>
    nnoremap <Tab> :Unite -start-insert buffer<cr>
    nnoremap <S-Tab> :b#<cr>
"}}}
Plug 'Shougo/vimfiler.vim'
    nnoremap <C-e> :VimFiler -buffer-name=explorer<CR>
    let g:vimfiler_ignore_pattern = '\%(.spec.js\)$'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'myusuf3/numbers.vim'
"Plug 'mjbrownie/pythoncomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
" airline config {{{
    let g:airline#extensions#tabline#enabled = 1

    function! AirlineInit()
        " :help airline-customization
        let g:airline_section_a = airline#section#create([])
        let g:airline_section_b = airline#section#create([])
        " let g:airline_section_c = airline#section#create([])
        " let g:airline_section_c = '%t'
        " let g:airline_section_gutter = airline#section#create([])
        let g:airline_section_x = airline#section#create([])
        let g:airline_section_y = airline#section#create(['mode','crypt','paste','iminsert'])
        " let g:airline_section_z = airline#section#create([])
        " let g:airline_section_warning = airline#section#create([])
    endfunction
    autocmd VimEnter * call AirlineInit()
    let g:airline_powerline_fonts = 1
"}}}
Plug 'scrooloose/syntastic'
Plug 'plasticboy/vim-markdown'
"Plug 'jeetsukumaran/vim-buffergator'"lo amo pero reemplazable por "unite buffer
Plug 'Yggdroot/indentLine'
Plug 'digitaltoad/vim-jade'
"Plug 'justinmk/vim-sneak'
Plug 'Chiel92/vim-autoformat' " Beautifier
"Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'szw/vim-maximizer'
    nnoremap m :MaximizerToggle<cr>
Plug 'chrisbra/Recover.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/deoplete.nvim'
    let g:deoplete#enable_at_startup = 1

call plug#end()"}}}
