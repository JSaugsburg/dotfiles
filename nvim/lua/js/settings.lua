local g = vim.g
local o = vim.opt
local cmd = vim.cmd


o.termguicolors = true
-- colorscheme
vim.ui.gruvbox_material_background = 'hard'
cmd('colorscheme gruvbox-material')

-- damit auch vim panes aktiv / inaktiv unterschieden wird muss none bei guibg stehen
-- https://dev.to/serhatteker/tmux-vim-active-pane-focus-5378
-- muss nach colorscheme gesetzt werden
cmd('highlight Normal guibg=none ctermbg=none')
cmd('highlight EndOfBuffer guibg=none ctermbg=none')

-- keine swap files
o.swapfile = false
-- Sets how many lines of history VIM has to remember
o.history = 500

-- relative Zeilennummern
o.number = true 
o.relativenumber = true
-- underscore wird als word boundary anerkannt
o.iskeyword:remove("_")

-- nur 350ms bei keyinput warten (z.B. bei jk)
o.timeoutlen=350
o.ttimeoutlen=20

-- status text ausblenden -> kommt von Statusline
o.showmode = false
-- no backups
o.backup = false
o.writebackup = false

-- mouse support -> bei tmux scroll nützlich
o.mouse = 'nv'

-- Map leader
g.mapleader = ','
g.maplocalleader = ','

-- vim-Rooter
-- Bei Öfnnen eines Buffers wird automatisch in das Verzeichnis gewechselt
g['rooter_cd_cmd'] = 'lcd'

-- node host setzen
g.node_host_prog = '/home/sepp/.nvm/versions/node/v16.16.0/bin/neovim-node-host'
