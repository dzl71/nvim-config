return {
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					overrideCommand = {
						"cargo", "clippy", "--message-format=json"
					}
				},
				inlayHints = {
					lifetimeElisionHints = {
						enable = "always", -- skip_trivial
						useParameterNames = true,
					}
				}
			}
		}
	}
}
