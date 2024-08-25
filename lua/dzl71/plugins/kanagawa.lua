local opts = {
	commentStyle = { italic = false },
}

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup(opts)
		vim.cmd("colorscheme kanagawa")
	end
}
