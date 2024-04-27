return {
	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					overrideCommand = {
						"cargo", "clippy", "--message-format=json", -- make the linter be clippy
						'--',
						'-A',                     -- allow the following cases
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
