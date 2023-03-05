--vim.lsp.set_log_level("debug")
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '_d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '-d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1], 'utf-8')

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result, 'utf-8')
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr,  }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  --vim.keymap.set('n', 'gd', ':tab split<cr><cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = lsp_flags
}
require('lspconfig')['sumneko_lua'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false
      }
    }
  }
}
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags
}
require('lspconfig')['rust_analyzer'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}
require('lspconfig').awk_ls.setup{
  cmd = { '/home/sepp/.nvm/versions/node/v16.16.0/bin/awk-language-server' }
}
require('lspconfig')['perlpls'].setup{}
require('lspconfig')['bashls'].setup{}
require('lspconfig')['omnisharp'].setup{
  cmd = { "dotnet", "/home/sepp/Software/Omnisharp/OmniSharp.dll" },
}
