local opts = {
	defaults = {
		initial_mode = "normal"
	}
}
return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require("telescope").setup(opts)
	end
}
