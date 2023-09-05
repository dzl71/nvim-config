return {
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					overrideCommand = {
						"cargo", "clippy", "--message-format=json"
					}
				}
			}
		}
	}
}
