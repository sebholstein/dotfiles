local keymap = vim.keymap

vim.g.mapleader = ' '
local opts = { silent=true, buffer=0 }


-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards (very usefull)
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all lines in file
keymap.set('n', '<C-A>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('n', '<C-h>', '<C-w>h')
-- keymap.set('n', '<C-j>', '<C-w>j')
-- keymap.set('n', '<C-k>', '<C-w>k')
-- keymap.set('n', '<C-l>', '<C-w>l')
vim.cmd('let g:BASH_Ctrl_j = \'off\'')
-- vim.cmd('nnoremap <C-j> <C-w>j')
-- vim.cmd('nnoremap <C-k> <C-w>k')

-- Resize window
keymap.set('n', '<Right>', '<C-w><')
keymap.set('n', '<Left>', '<C-w>>')
keymap.set('n', '<Down>', '<C-w>+')
keymap.set('n', '<Up>', '<C-w>-') 

-- telescope (fuzzy finding)
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>lg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fd', telescope.diagnostics, {})

-- nvim tree file browser
local nt_api = require("nvim-tree.api")
keymap.set('n', '<C-n>', nt_api.tree.toggle, {})

-- lsp
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- trouble.nvi
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)

-- lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>FloatermNew --height=0.95 --width=0.95 lazygit<cr>', {silent = true, noremap = true})

vim.keymap.set('n', '<leader>m', require("harpoon.mark").add_file)
vim.keymap.set('n', '<leader>hh', require("harpoon.ui").toggle_quick_menu)
vim.keymap.set('n', '<leader>h1', function() return require("harpoon.ui").nav_file(1) end)
vim.keymap.set('n', '<leader>h2', function() return require("harpoon.ui").nav_file(2) end)
vim.keymap.set('n', '<leader>h3', function() return require("harpoon.ui").nav_file(3) end)
vim.keymap.set('n', '<leader>h4', function() return require("harpoon.ui").nav_file(4) end)
vim.keymap.set('n', '<leader>o', require("harpoon.ui").nav_next)
vim.keymap.set('n', '<leader>i', require("harpoon.ui").nav_prev)
--



