"################################################################################
"# Neovim Configuration
"################################################################################

" Requirements {{{
" - vim-plug
" - fzf
" - git
" }}}
" Plugins {{{
call plug#begin(stdpath('data'). '/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'mhinz/vim-startify'
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
" Always load the vim-devicons last!
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}
" General Settings {{{
set clipboard=unnamed
set mouse=n
set number
set relativenumber
" folding
set foldenable " enable folding
" organize init.vim with folds
set foldmethod=indent
set foldlevelstart=10
set foldlevel=0
set modelines=1
" }}}
" Visual Settings {{{
syntax on
colorscheme onedark
let g:airline_theme = 'onedark'
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" let g:airline_theme = 'gruvbox'
" set termguicolors
" disable default mode indicator
set noshowmode
" Setting transparent background
hi Normal guibg=NONE ctermbg=NONE
" }}}
" Shortcuts and Leader Settings {{{
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
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" vim-go specific shortcuts
" browse errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" close error list
nnoremap <leader>a :cclose<CR>

" build or run Go program
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
" }}}
" Plugin Configurations {{{
" vim-go
" only use quickfix window
let g:go_list_type = "quickfix"
" }}}
" Coc Configurations {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

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
" }}}
" vim:foldmethod=marker:foldlevel=0
