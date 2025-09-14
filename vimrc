syntax on
filetype plugin indent on

set number
set title
set mouse=a
set title
set noet
set listchars+=space:␣
set tabstop=8
set shiftwidth=8
set noexpandtab
set colorcolumn=80
set hlsearch
set shortmess-=S
set confirm
set autoindent
set ruler
set is
set hls

syntax on
colo jellybeans

nnoremap J <C-d>
nnoremap K <C-u>

colo jellybeans

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=#2E2E2E

set listchars=tab:»\ ,eol:¬,space:·
let g:vim_markdown_folding_disabled = 1
