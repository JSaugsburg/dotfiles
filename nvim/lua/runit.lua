--require("plenary.reload").reload_module("js", true)
--require("impatient")
--require("js.plugins")
--require("js.mappings")
--require("js.settings")
--require("lualine").setup()
require("gitsigns").setup()
--require'lspconfig'.pyright.setup{}
require("js.lspconfig")
require("js.feline")
require("js.telescope")
--require("feline").setup()
--require("js.cmp")
