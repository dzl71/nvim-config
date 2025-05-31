local opts = {
	commentStyle = { italic = false },
	overrides = function(colors)
		local theme = colors.theme
		return {
			Pmenu = {
				fg = theme.ui.shade0,
				bg = theme.ui.bg_p1,
				-- add `blend = vim.o.pumblend` to enable transparency
				blend = vim.o.pumblend,
			},
			PmenuSel = { fg = "NONE", bg = "#2C4462" }, -- bg = theme.ui.bg_p2
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end,
}

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup(opts)
		vim.cmd("colorscheme kanagawa")
	end
}

