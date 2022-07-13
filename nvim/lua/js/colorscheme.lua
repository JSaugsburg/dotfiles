vim.ui.gruvbox_material_background = 'hard'
vim.cmd('colorscheme gruvbox-material')
-- 
-- damit auch vim panes aktiv / inaktiv unterschieden wird muss none bei guibg stehen
-- https://dev.to/serhatteker/tmux-vim-active-pane-focus-5378
-- muss nach colorscheme gesetzt werden
vim.cmd('highlight Normal guibg=none ctermbg=none')
vim.cmd('highlight EndOfBuffer guibg=none ctermbg=none')
