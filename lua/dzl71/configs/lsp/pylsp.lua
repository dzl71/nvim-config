local lspconfig = require("lspconfig")

return {
	settings = {
		pylsp = {
			plugins = {
				-- linter options
				pylint = { enabled = true, executable = "pylint" },
				-- type checker
				pylsp_mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = true },
			},
		},
	},
	flags = {
		debounce_text_changes = 200,
	},
}
