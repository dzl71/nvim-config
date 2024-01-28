-- utils
vim.keymap.set("n", "<leader>n", vim.cmd.E)
vim.keymap.set({ "n", "v", "i", "c", "s" }, "<C-s>", "<Esc><Cmd>noh<CR><Cmd>w<CR>") -- save file and exit modes
-- vim.keymap.set({'n', 'v', 'i', 'c', 's'}, "<Esc>", "<Esc><Cmd>noh<CR>")
vim.keymap.set("n", "<leader>yy", '"+yy')                                           -- copy line to clippboard
vim.keymap.set("v", "<leader>y", '"+y')                                             -- coppy selected text to clippboard
vim.keymap.set("n", "<leader>p", '"+p')                                             -- paste a from clippboard
vim.keymap.set("n", "<leader>P", '"+P')                                             -- paste before cursor from clippboard
vim.keymap.set("v", "<leader>p", [["_dP]])                                          -- save the current item in the buffer after change
vim.keymap.set("n", "<leader>x", "<Cmd>bd!<CR>")                                    -- close current buffer


-- ==================================================================
-- ==                                                              ==
-- ==     telescope keybindings located at configs.telescope       ==
-- ==                                                              ==
-- ==================================================================

-- toggle and untoggle undotree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', {})

-- show vim fugitive
vim.keymap.set("n", "<leader>gi", vim.cmd.Git)

-- window jumping
vim.keymap.set("n", "<C-j>", '<C-w>j') -- jump to lower window
vim.keymap.set("n", "<C-k>", '<C-w>k') -- jump to upper window
vim.keymap.set("n", "<C-l>", '<C-w>l') -- jump to righter window
vim.keymap.set("n", "<C-h>", '<C-w>h') -- jump to lefter window

-- swap windows
vim.keymap.set("n", "<C-S-j>", '<C-w>J') -- swap with lower window
vim.keymap.set("n", "<C-S-k>", '<C-w>K') -- swap with upper window
vim.keymap.set("n", "<C-S-l>", '<C-w>L') -- swap with righter window
vim.keymap.set("n", "<C-S-h>", '<C-w>H') -- swap with lefter window

-- moving the line of the selected text up and down
vim.keymap.set("v", "J", ":m .+<CR>gv=gv")
vim.keymap.set("v", "K", ":m .-2<CR>gv=gv")

-- keeps the cursor at the middle of the screen when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

-- keeps the cursor in the middle while searching tesrms through "/"
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- open terminal in a new tab
-- vim.keymap.set("n", "<leader>t", ":edit term://bash<Cr>")

-- moving in insert mode
vim.keymap.set("i", "<C-j>", '<Down>')  -- jump to lower window
vim.keymap.set("i", "<C-k>", '<Up>')    -- jump to upper window
vim.keymap.set("i", "<C-l>", '<Right>') -- jump to righter window
vim.keymap.set("i", "<C-h>", '<Left>')  -- jump to lefter window
