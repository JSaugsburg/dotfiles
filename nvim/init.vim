call plug#begin('~/.config/nvim/plugged')
"Plug 'f3fora/cmp-spell'
"Plug 'hrsh7th/cmp-emoji'
"Plug 'windwp/nvim-autopairs'
call  plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python2, perl und ruby provider nicht benötigt
let g:loaded_python_provider=0
let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

" Node Pfad
let g:node_host_prog = '/home/sepp/.nvm/versions/node/v18.7.0/lib/node_modules/neovim/bin/cli.js'


" cmp setting
set completeopt=menu,menuone,noselect
" keine swap files
set noswapfile
" Sets how many lines of history VIM has to remember
set history=500

" relative Zeilennummern
set number relativenumber

" underscore wird als word boundary anerkannt
set iskeyword-=_

" nur 500ms bei keyinput warten (z.B. bei jk)
set timeout timeoutlen=500 ttimeoutlen=20

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

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" dashboard
"let g_dashboard_default_executive='fzf'

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
lua require("plugins")
lua require("runit")
