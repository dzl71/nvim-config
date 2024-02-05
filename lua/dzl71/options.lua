vim.api.nvim_set_hl(0, "Normal", { bg = "none" })      -- makes the background "transparent"
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- makes the background of floats "transparent"

--makes line numbers more contrast
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#8A8A8A', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#8A8A8A', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#8A8A8A', bold = true })

vim.opt.guicursor = "" -- make the cursor fat and full


vim.opt.nu = true             -- enable line numerations
vim.opt.relativenumber = true -- enable relative numbers

-- makes indenting normal
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false -- disable line wraping

-- disable nvims backups
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- setts the undodir to this directory

vim.opt.undofile = true                                -- eanble undotree backups

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.o.cursorline = true
vim.o.culopt = "line"

vim.opt.shell = '/usr/bin/bash'
