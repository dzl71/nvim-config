vim.g.mapleader = ' '

--local fileType = vim.bo.filetype
--local commentType = {
--	[""] = "",
--	["zig"] = "//",
--	["python"] = "#",
--	["java"] = "//",
--	["c"] = "//",
--	["rust"] = "//",
--	["lua"] = "--",
--	["go"] = "//",
--}

-- utils
--vim.keymap.set('v', '<leader>;', '<C-v>_I' .. commentType[fileType] .. '<Esc>:w<CR>')      -- comment line
--vim.keymap.set('v', '<leader>/', '<C-v>:s/' .. commentType[fileType] .. '/<CR><Cmd>w<CR>') -- uncomment line
vim.keymap.set("n", "<leader>n", vim.cmd.E)
vim.keymap.set({ "n", "v", "i", "c", "s", }, "<C-s>", "<Esc><Cmd>noh<CR><Cmd>w<CR>")        -- save file and exit modes
vim.keymap.set("n", "<leader>yy", '"+yy')                                                  -- copy line to clippboard
vim.keymap.set("v", "<leader>y", '"+y')                                                    -- coppy selected text to clippboard
vim.keymap.set("n", "<leader>x", "<Cmd>bd<CR>")                                            -- close current buffer
vim.keymap.set("n", "<C-a>", "ggVG")                                                       -- select all

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>gl', telescope.live_grep, {})                 -- find text across all the files in a workspace
vim.keymap.set('n', '<leader>gs', telescope.current_buffer_fuzzy_find, {}) -- find text in the current file/buffer
vim.keymap.set('n', '<leader><Tab>', telescope.buffers, {})                -- search buffers
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })

-- undotree
--vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', {})

-- vim-fugitive
vim.keymap.set("n", "<leader>gi", vim.cmd.Git)

-- window jumping
vim.keymap.set("n", "<C-j>", '<C-w>j') -- jump to lower window
vim.keymap.set("n", "<C-k>", '<C-w>k') -- jump to upper window
vim.keymap.set("n", "<C-l>", '<C-w>l') -- jump to righter window
vim.keymap.set("n", "<C-h>", '<C-w>h') -- jump to lefter window

-- moving the line of the selected text up and down
vim.keymap.set("v", "J", ":m .+<CR>gv=gv")
vim.keymap.set("v", "K", ":m .-2<CR>gv=gv")

-- keeps the cursor at the middle of the screen when jumping up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keeps the cursor in the middle while searching tesrms through "/"
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- open terminal in a new tab
vim.keymap.set("n", "<leader>tt", vim.cmd.terminal)

-- moving in insert mode
vim.keymap.set("i", "<C-j>", '<Down>')  -- jump to lower window
vim.keymap.set("i", "<C-k>", '<Up>')    -- jump to upper window
vim.keymap.set("i", "<C-l>", '<Right>') -- jump to righter window
vim.keymap.set("i", "<C-h>", '<Left>')  -- jump to lefter window
