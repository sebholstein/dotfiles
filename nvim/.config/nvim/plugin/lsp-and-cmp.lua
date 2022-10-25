require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

vim.opt.completeopt={'menu','menuone','noselect'}


local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  print("LSP attached")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>vd', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>vi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>vh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>vsh', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>vn', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
end


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    -- Server-specific settings...
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {}
    }
}

require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.astro.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.tailwindcss.setup{
  on_attach = on_attach,
    capabilities = capabilities
}

