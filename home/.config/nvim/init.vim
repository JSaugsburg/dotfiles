"################################################################################
"# Neovim Configuration
"################################################################################
"
" Requirements
" - vim-plug
" - fzf
" - git

"################################################################################
"# Plugins
"################################################################################

call plug#begin(stdpath('data'). '/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" Always load the vim-devicons last!
Plug 'ryanoasis/vim-devicons'
call plug#end()

"################################################################################
"# General Settings
"################################################################################

set clipboard=unnamed
set number
set relativenumber
" set foldmethod=indent

"################################################################################
"# Visual Settings
"################################################################################

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:airline_theme = 'gruvbox'
set termguicolors
" disable default mode indicator
set noshowmode
" Setting transparent background
hi Normal guibg=NONE ctermbg=NONE

"################################################################################
"# Shortcuts and Leader Settings
"################################################################################

let mapleader=","	" leader is comma
" exit insert or visual mode with jk
inoremap jk <esc>
vnoremap jk <esc>
" space open/closes folds
nnoremap <space> za
" open init.vim
nnoremap <leader>vm :vsp $MYVIMRC<CR>
" save file
nnoremap <leader>s :w<CR>
" close current buffer
nnoremap <leader>x :bd<CR>
" close all buffers
nnoremap <leader>z :%bd<CR>
" exit vim
nnoremap <silent><leader>q :q<CR>

" vim-go specific shortcuts
" browse errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" close error list
nnoremap <leader>a :cclose<CR>

" build or run Go program
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)

"################################################################################
"# Plugin Configurations
"################################################################################

" defx
let g:defx_icons_enable_syntax_highlight = 1

" vim-go
" only use quickfix window
let g:go_list_type = "quickfix"

"################################################################################
"# Coc Configurations
"################################################################################

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Remove messages from in-completion menus
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
