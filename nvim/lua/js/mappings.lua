function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- escape visual or normal mode with "jk"
imap('jk', '<esc>')
vmap('jk', '<esc>')

-- TELESCOPE

-- Find files using Telescope command-line sugar.
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Fast saving
nmap("<leader>s", ":w<cr>")
-- Fast quit
nmap("<leader>q", ":q<cr>")
-- Close all files and quit
nmap("<leader>Q", ":qa<cr>")
-- unhighlight
nmap("<leader><Space>", ":noh<cr>")

-- open nvim config file
nmap("<leader>vm", ":tabedit ~/.config/nvim/init.lua<cr>")

-- Reload nvim config file
nmap("<leader>r", ":source ~/.config/nvim/init.lua<cr>")

nmap("<leader>x", "<cmd>lua require('js.utils.sudowrite').sudoWrite()<CR>")
-- :W sudo saves the file
-- (useful for handling the permission-denied error)
-- command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
--
--' no swapfiles
--set nobackup
--set nowritebackup
--
--' coc configuration
--'inoremap <silent><expr> <TAB>
--'      \ pumvisible() ? '\<C-n>' :
--'      \ <SID>check_back_space() ? '\<TAB>' :
--'      \ coc#refresh()
--'inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'
--'
--'function! s:check_back_space() abort
--'  let col = col('.') - 1
--'  return !col || getline('.')[col - 1]  =~# '\s'
--'endfunction
--'
--'' Use K to show documentation in preview window.
--'nnoremap <silent> K :call <SID>show_documentation()<CR>
--'
--'function! s:show_documentation()
--'  if (index(['vim','help'], &filetype) >= 0)
--'    execute 'h '.expand('<cword>')
--'  elseif (coc#rpc#ready())
--'    call CocActionAsync('doHover')
--'  else
--'    execute '!' . &keywordprg . ' ' . expand('<cword>')
--'  endif
--'endfunction
--'
--'' coc-snippets
--'imap <C-t> <Plug>(coc-snippets-expand)
--
--' airline
--let g:airline#extensions#tabline#enabled = 1
--let g:airline_powerline_fonts = 1
--
