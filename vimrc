filetype off 

set rtp+=$HOME/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"go
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

"colorscheme
Plugin 'junegunn/seoul256.vim'
Plugin 'sickill/vim-monokai'
Plugin 'AlessandroYorba/Sierra'
Plugin 'jacoborus/tender.vim'
Plugin 'arzg/vim-colors-xcode'

"tools
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'Syntastic'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Raimondi/delimitMate'

"airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'


call vundle#end()

filetype plugin indent on "indent/plugin load by filetype
syntax on
set si "smart indent
set expandtab
set ts=4 
set sw=4 
set smarttab 
set nu 
set wmnu
set ignorecase 
set smartcase
set showmatch
set hlsearch
set incsearch
set fileencodings=utf-8,euc-kr
set ruler
set title
set scrolloff=5
set linebreak
let &showbreak = '+++ ' 
set list listchars=trail:· 
set t_Co=256
set backspace=indent,eol,start
set mouse=a

""map settings
map <F1> :NERDTreeToggle<CR>
map <F2> :SignifyToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :SyntasticToggleMode<CR>
noremap <C-n> :bnext<CR>
noremap <C-b> :bprev<CR>
noremap m :noh<CR>
"inoremap <C-u> <C-o>u
"inoremap jk <ESC>
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

""airline settings
set laststatus=2
"autocmd VimEnter * AirlineTheme base16_ashes
"autocmd VimEnter * AirlineTheme hybrid
autocmd VimEnter * AirlineTheme luna
"autocmd VimEnter * AirlineTheme fruit_punch
"autocmd VimEnter * AirlineTheme light
let g:airline_powerline_fonts = 1

" parenthesis autocompletion
let delimitMate_expand_cr=1

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
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ ''     : 'V',
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

"colorscheme settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"if (has("termguicolors"))
"    set termguicolors
"endif

"colorscheme xcodelight
"colorscheme seoul256
"colorscheme pablo
"let g:rehash256 = 1

"tagbar settings
let g:tagbar_width = 20

"AutoComplPop
set omnifunc=''
let g:ycm_min_num_of_chars_for_completion = 2

"nerdTree settings
autocmd VimEnter * if !argc() | NERDTreeCWD | endif
let NERDTreeIgnore=['\.o$', '\~$']
let g:NERDTreeWinSize = 20 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": []}
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

if has("cscope")
    set cscopetag
    set csto=0
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d ^<C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 5])
    endif
endfunction


set encoding=utf-8
set fileencodings=utf-8,euc-kr

