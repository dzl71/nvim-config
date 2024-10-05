local keybindings = require("config.keybindings.plugins.telescope")

local function configured(opts)
	return {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		keys = keybindings.keys,
		config = function()
			require("telescope").setup(opts)
		end,
	}
end

local opts = {
	defaults = {
		initial_mode = "normal",
		mappings = keybindings.mappings
	},
}

return configured(opts)
