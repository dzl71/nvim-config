local opts = {
	defaults = {
		initial_mode = "normal",
	},
}

local function keybinds()
	local telescope = require("telescope.builtin")

	vim.keymap.set('n',
		'<leader>ff',
		function() telescope.find_files({ hidden = true }) end,
		{ desc = "find files" }
	)

	vim.keymap.set('n',
		'<leader><Tab>',
		telescope.buffers,
		{ desc = "find buffers" }
	)

	vim.keymap.set('n',
		'<leader>/',
		telescope.current_buffer_fuzzy_find,
		{ desc = "fuzzy find text in the current buffer" }
	)

	vim.keymap.set('n',
		'<leader>gl',
		telescope.live_grep,
		{ desc = "find text across all files in workspace" }
	)

end

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require("telescope").setup(opts)
		keybinds()
	end,
}
