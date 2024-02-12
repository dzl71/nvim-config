local rt = require("rust-tools")

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
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
		end,
	},
	tools = {
		inlay_hints = {
			auto = true,
			parameter_hints_prefix = "parameters ",
		},
	},
}
