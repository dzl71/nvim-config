local inlay_hints = require("inlay-hints")

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
		on_attach = function(client, bufnr)
			inlay_hints.on_attach(client, bufnr)
		end,
	},
	tools = {
		on_initialized = function()
			inlay_hints.set_all()
		end,
		inlay_hints = {
			auto = false
		},
	},
}
