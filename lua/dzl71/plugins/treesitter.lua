local opts = {
	ensure_installed = {
		"rust",
		"lua",
		"python",
		"vimdoc",
		"java",
		"c",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
	-- this should make indentations better
	-- indent = { enable = true },
}

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup(opts)
	end
}
