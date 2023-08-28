local lsp = require("lsp-zero")
local rt = require("rust-tools")

return {
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
				rustfmt = {
					hard_tabs = true,
					tab_spaces = 4,
				}
			}
		},
	},
}
