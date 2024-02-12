vim.g.rustaceanvim = {
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
				inlayHints = {
					lifetimeElisionHints = {
						enable = "always", -- skip_trivial
						useParameterNames = true,
					},
					closingBraceHints = {
						enable = true,
						minLines = 0,
					}
				},
			}
		},
		on_attach = function(a, b)
			ih.on_attach(a, b)
		end
	},
	tools = {
		on_initialized = function()
			ih.set_all()
		end,
		inlay_hints = {
			auto = false,
		},
	}
}
