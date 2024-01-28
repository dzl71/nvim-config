local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', function() telescope.find_files({ hidden = true }) end, {})
vim.keymap.set('n', '<leader>gl', telescope.live_grep, {})                 -- find text across all the files in a workspace
vim.keymap.set('n', '<leader>/', telescope.current_buffer_fuzzy_find, {}) -- find text in the current file/buffer
vim.keymap.set('n', '<leader><Tab>', telescope.buffers, {})                -- search buffers
vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = true })

return {
	defaults = {
		initial_mode = "normal"
	}
}
