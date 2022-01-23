local g = vim.g
local bo = vim.bo
local opt = vim.opt
local cmd = vim.cmd


-- keine swap files
opt.swapfile = false
-- Sets how many lines of history VIM has to remember
opt.history = 500

-- relative Zeilennummern
opt.number = true 
opt.relativenumber = true
--" underscore wird als word boundary anerkannt
opt.iskeyword = opt.iskeyword - { "_" }

--" nur 500ms bei keyinput warten (z.B. bei jk)
opt.timeoutlen=500
opt.ttimeoutlen=20

--" Enable filetype plugins
cmd [[ filetype plugin on ]]
cmd [[ filetype indent on ]]
-- status text ausblenden -> kommt von Statusline
opt.showmode = false
-- no backups
opt.backup = false
opt.writebackup = false
