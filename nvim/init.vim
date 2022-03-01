call plug#begin('~/.config/nvim/plugged')
"Plug 'ajmwagar/vim-deus'
Plug 'sainnhe/gruvbox-material'
"Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
"Plug 'glepnir/dashboard-nvim'

Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'L3MON4D3/LuaSnip'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'octaltree/cmp-look'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-emoji'
Plug 'windwp/nvim-autopairs'
Plug 'L3MON4D3/LuaSnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
call  plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox-material
"colorscheme deus
" damit auch vim panes aktiv / inaktiv unterschieden wird muss none bei guibg stehen
" https://dev.to/serhatteker/tmux-vim-active-pane-focus-5378
" highlight Normal guifg=#D8DEE9 guibg=none
highlight Normal guibg=none ctermbg=none
highlight EndOfBuffer guibg=none ctermbg=none
"highlight Normal ctermfg=223 ctermbg=none guifg=#D4BE98 guibg=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python2, perl und ruby provider nicht benötigt
let g:loaded_python_provider=0
let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

" Node Pfad
"let g:loaded_node_provider = '/home/sepp/.nvm/versions/node/v17.4.0/bin/node'


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
lua require("runit")
