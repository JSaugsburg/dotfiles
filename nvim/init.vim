call plug#begin('~/.vim/plugged')
"Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
"Plug 'glepnir/dashboard-nvim'
call  plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox-material
"colorscheme deus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" relative Zeilennummern
set number relativenumber

" underscore wird als word boundary anerkannt
set iskeyword-=_

" nur 500ms bei keyinput warten (z.B. bei jk)
set timeout timeoutlen=500 ttimeoutlen=100

" Enable filetype plugins
filetype plugin on
filetype indent on

let mapleader=","

" status text ausblenden -> kommt von airline
set noshowmode

" Fast saving
nmap <leader>s :w<cr>

" Fast quit
nmap <leader>q :q<cr>
" Close all files and quit
nmap <leader>Q :qa<cr>

" unhighlight
nmap <leader><Space> :noh<cr>

" exit insert or visual mode
inoremap jk <esc>
vnoremap jk <esc>

" open nvim config file
nmap <leader>vm :tabedit ~/.config/nvim/init.vim<cr>

" Reload nvim config file
nmap <leader>r :source ~/.config/nvim/init.vim<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" no swapfiles
set nobackup
set nowritebackup

" coc configuration
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc-snippets
imap <C-t> <Plug>(coc-snippets-expand)

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" dashboard
let g_dashboard_default_executive='fzf'

" open netrw
" with vertical split
nmap <leader>E :Vexplore<cr>
" with new tab
nmap <leader>e :Texplore<cr>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
