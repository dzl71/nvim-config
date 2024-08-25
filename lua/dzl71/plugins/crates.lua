local function configured_crates(opts)
	return {
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup(opts)
		end,
	}
end

local opts = {}

return configured_crates(opts)
