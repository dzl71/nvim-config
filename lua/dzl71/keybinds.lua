-- general
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = "toggle undo-tree", })
vim.keymap.set('n', "<leader>n", vim.cmd.Ex, { desc = "explore directory of current file", })
vim.keymap.set('n', "<leader>x", "<Cmd>bd!<CR>", { desc = "close current buffer", })

-- clippboard
vim.keymap.set('v', "<leader>y", '"+y', { desc = "coppy selected to clippboard", })
vim.keymap.set('n', "<leader>yy", '"+yy', { desc = "copy line to clippboard", })
vim.keymap.set('n', "<leader>p", '"+p', { desc = "paste after cursor from clippboard", })
vim.keymap.set('n', "<leader>P", '"+P', { desc = "paste before cursor from clippboard", })

-- center jumps
vim.keymap.set( 'n', "<C-d>", "<C-d>zz", {})
vim.keymap.set( 'n', "<C-u>", "<C-u>zz", {})
vim.keymap.set( 'n', "G", "Gzz", {})
vim.keymap.set( 'n', "n", "nzzzv", {})
vim.keymap.set( 'n', "N", "Nzzzv", {})
