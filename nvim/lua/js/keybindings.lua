local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- escape visual or normal mode with 'jk'
map('i', 'jk', '<esc>')
map('v', 'jk', '<esc>')

-- reload lua config
map('n', '<leader>rc', '<cmd>lua reload_nvim_conf()<cr>')

-- TELESCOPE

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Fast saving
map('n', '<leader>s', ':w<cr>')
-- Fast quit
map('n', '<leader>q', ':q<cr>')
-- Close all files and quit
map('n', '<leader>Q', ':qa<cr>')
-- unhighlight
map('n', '<leader><Space>', ':noh<cr>')

-- Ans Ende der Zeile springen in Insert Mode
map('i', '<C-e>', '<End>')
----
----' no swapfiles
----set nobackup
----set nowritebackup
----
----' coc configuration
----'inoremap <silent><expr> <TAB>
----'      \ pumvisible() ? '\<C-n>' :
----'      \ <SID>check_back_space() ? '\<TAB>' :
----'      \ coc#refresh()
----'inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'
----'
----'function! s:check_back_space() abort
----'  let col = col('.') - 1
----'  return !col || getline('.')[col - 1]  =~# '\s'
----'endfunction
----'
----'' Use K to show documentation in preview window.
----'nnoremap <silent> K :call <SID>show_documentation()<CR>
----'
----'function! s:show_documentation()
----'  if (index(['vim','help'], &filetype) >= 0)
----'    execute 'h '.expand('<cword>')
----'  elseif (coc#rpc#ready())
----'    call CocActionAsync('doHover')
----'  else
----'    execute '!' . &keywordprg . ' ' . expand('<cword>')
----'  endif
----'endfunction
----'
----'' coc-snippets
----'imap <C-t> <Plug>(coc-snippets-expand)
----
----' airline
----let g:airline#extensions#tabline#enabled = 1
----let g:airline_powerline_fonts = 1
----
