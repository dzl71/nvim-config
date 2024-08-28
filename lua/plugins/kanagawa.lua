local function configured_kanagawa(opts)
	return {
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup(opts)
			vim.cmd("colorscheme kanagawa")
		end
	}
end

local opts = {
	commentStyle = { italic = false },
}

return configured_kanagawa(opts)
