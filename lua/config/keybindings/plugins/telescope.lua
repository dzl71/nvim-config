local telescope = require("telescope.builtin")
local telescope_actions = require("telescope.actions")

-- all of the keys work in normal mode
local keys = {
	{
		'<leader>ff',
		function() telescope.find_files({ hidden = true }) end,
		{
			desc = "find files",
		}
	},
	{
		'<leader>gl',
		telescope.live_grep,
		{
			desc = "find text across all the files in a workspace",
		}
	},
	{
		'<leader>/',
		telescope.current_buffer_fuzzy_find,
		{
			desc = "find text in the current file/buffer",
		}
	},
	{
		'<leader><Tab>',
		telescope.buffers,
		{
			desc = "search buffers",
		}
	},

}

local mappings = {
	n = {
		["d"] = telescope_actions.delete_buffer
	}
}

return { keys = keys, mappings = mappings }
