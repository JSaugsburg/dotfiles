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
-- Workspace wechseln
map('n', '<leader>fp', ":<cmd>Telescope repo list<cr>")

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

-- leere Zeilen einfügen
map('n', '<A-Enter>', 'O<Esc>j')
map('n', '<cr>', 'o<Esc>k')

-- NVIMTREE
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- Tabs navigieren
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
