filetype off 
call plug#begin('~/.config/nvim/plugged')

"colorscheme
Plug 'junegunn/seoul256.vim'
Plug 'sickill/vim-monokai'
Plug 'AlessandroYorba/Sierra'
Plug 'jacoborus/tender.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'franbach/miramare'
Plug 'sainnhe/sonokai'
Plug 'stillwwater/vim-nebula'
Plug 'morhetz/gruvbox'

"code
"Plug 'fatih/vim-go'

"tools
"Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-scripts/AutoComplPop'
"Plug 'Valloric/YouCompleteMe'
"Plug 'eikenb/acp'
"Plug 'Syntastic'
"Plug 'wesQ3/vim-windowswap'
"Plug 'qpkorr/vim-bufkill'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'Raimondi/delimitMate'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

filetype plugin indent on "indent/plugin load by filetype
syntax on
set si 
set expandtab 
set ts=4 
set sw=4 
set smarttab 
set nu 
set wmnu 
set ignorecase 
set smartcase 
set nosmartindent 
set showmatch 
set hlsearch
set incsearch 
set fileencodings=utf-8,euc-kr
set ruler 
set title 
set scrolloff=5 
set linebreak 
let &showbreak = '+++ ' 
"set list listchars=trail:· 
"set listchars=trail:· 
"set listchars=tab:▸\ ,eol:¬
set t_Co=256
set clipboard+=unnamedplus

"colorscheme
"colorscheme xcodelight
"colorscheme sonokai
"colorscheme pablo
"colorscheme seoul256
" Light theme -> hybrid
"autocmd VimEnter * AirlineTheme hybrid
"autocmd VimEnter * AirlineTheme light
"autocmd VimEnter * AirlineTheme luna
"autocmd VimEnter * AirlineTheme base16_ashes
" Dark theme -> wombat
"autocmd VimEnter * AirlineTheme wombat

"map settings
"map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :CocDisable<CR>
noremap m :noh<CR>
"nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"go settings
"let g:go_fmt_command = "goimports"

"nerdTree settings
"autocmd VimEnter * if !argc() | NERDTreeCWD | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let NERDTreeIgnore=['\.o$[[file]]', '\.o.json$[[file]]', '\~$']
"let g:NERDTreeWinSize = 15

"tagbar settings
let g:tagbar_width = 20

""airline settings
set laststatus=2
let g:airline_powerline_fonts = 1

let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ''     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ }

let g:airline_skip_empty_sections = 1
"let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"let g:airline_section_x = airline#section#create(['filetype'])
let g:airline_section_y = airline#section#create(['ffenc'])
let g:airline_section_z = airline#section#create_right(['%P','%l:%c']) 
"let g:airline#extensions#default#section_truncate_width = {
"   \ 'a': 1
"   \}
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" parenthesis autocompletion
let delimitMate_expand_cr=1
let delimitMate_quotes = "\"  ` "

"coc settings
inoremap <nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

set encoding=utf-8
set fileencodings=utf-8,euc-kr

call coc#config('python', {'pythonPath': $PYENV_VIRTUAL_ENV})

nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

 " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
 "
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh() " use <tab> for trigger completion and navigate to the next complete item

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
