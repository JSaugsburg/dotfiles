require("onedark").setup  {
    -- Main options --
    style = "dark", -- Default theme style. Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
    term_colors = false, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"}, -- List of styles to toggle between
}

-- set colorscheme
vim.cmd([[colorscheme onedark]])
