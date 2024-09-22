local function configured_tokyonight(opts)
	return {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = opts,
		config = function ()
			vim.cmd("colorscheme tokyonight-night")
		end
	}
end

local opts = {}

return configured_tokyonight(opts)
