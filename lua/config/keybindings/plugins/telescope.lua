local telescope = require("telescope.builtin")

vim.keymap.set('n',
	'<leader>ff',
	function() telescope.find_files({ hidden = true }) end,
	{
		desc = "find files",
	}
)

vim.keymap.set('n',
	'<leader>gl',
	telescope.live_grep,
	{
		desc = "find text across all the files in a workspace",
	}
)

vim.keymap.set('n',
	'<leader>/',
	telescope.current_buffer_fuzzy_find,
	{
		desc = "find text in the current file/buffer",
	}
)

vim.keymap.set('n',
	'<leader><Tab>',
	telescope.buffers,
	{
		desc = "search buffers",

	}
)
