local function configured_indent_blankline(opts)
	return {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup(opts)
		end
	}
end

local opts = {}

return configured_indent_blankline(opts)
