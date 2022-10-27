" Hey there! This is my vim config. I use vim-plug as you can see right below. This config includes auto-completion, light/dark colorscheme auto switch "
" and a bunch of other stuff. This is subject to change, but if you want to give it a try, go ahead! "



" Show line numbers "
set number
set belloff=all
" enable mouse selection
set mouse=a 
call plug#begin('.vim/plugged')

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

Plug 'nickaroot/vim-xcode-dark-theme'
Plug 'statox/colorscheme-changer.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Konfekt/vim-office'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:airline#extensions#tabline#enabled = 1
set termguicolors

let g:airline_theme='base16_atelier_cave_light'


let g:dayColorscheme    = 'shine'
let g:nightColorscheme  = 'xcode_dark'

set wrap

set laststatus =2 

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle




autocmd VimEnter * NERDTree

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs', 
  \ 'coc-json',
  \ 'coc-flutter',
  \ 'coc-clangd',
  \ 'coc-prettier'
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
