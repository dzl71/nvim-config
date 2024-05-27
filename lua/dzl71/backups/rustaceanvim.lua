local opts = {
	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					overrideCommand = {
						-- make the linter be clippy
						"cargo",
						"clippy",
						"--message-format=json",
						-- pass aditional arguments
						'--',
						'-A',
						-- allow the following cases
						'clippy::needless_return',
					}
				},
			},
		},
	},
	tools = {
		inlay_hints = {
			auto = false
		},
	},
}

return {
	'mrcjkb/rustaceanvim',
	ft = { "rust" },
	version = '^4',
	config = function()
		vim.g.rustaceanvim = opts
	end
}
