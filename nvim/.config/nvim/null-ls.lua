
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})
sources = { null_ls.builtins.diagnostics.buf }
local sources = { null_ls.builtins.diagnostics.checkmake }
local sources = { null_ls.builtins.formatting.buf }
local sources = { null_ls.builtins.formatting.prettierd }
local sources = { null_ls.builtins.code_actions.eslint }

