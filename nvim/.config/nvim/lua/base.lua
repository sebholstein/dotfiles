vim.cmd('autocmd!')


vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.ai = true -- auto indenting
vim.opt.si = true -- smart indenting
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Find files: search down the path
vim.opt.wildignore:append { '**/node_modules/*' } 
vim.opt.showtabline=2 -- neded for Staline.vim
vim.opt.laststatus = 2 -- neded for Staline.vim

vim.cmd("set winbar=%=%m\\ %f")

vim.g.lazygit_floating_window_use_plenary = 1
vim.g.lexima_enable_basic_rules = 1

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.cmd('colorscheme darcula')

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
}

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
