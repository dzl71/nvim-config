return function(opts)
	vim.keymap.set("n",
		"gd",
		function()
			vim.lsp.buf.definition()
		end,
		opts
	)

	vim.keymap.set("n",
		"gr",
		function()
			vim.lsp.buf.references()
		end,
		opts
	)

	vim.keymap.set("n",
		"K",
		function()
			vim.lsp.buf.hover()
		end,
		opts
	)

	vim.keymap.set("n",
		"<leader>e",
		function()
			vim.diagnostic.open_float()
		end,
		opts
	)

	vim.keymap.set("n",
		"gn",
		function()
			vim.diagnostic.goto_next()
		end,
		opts
	)

	vim.keymap.set("n",
		"gp",
		function()
			vim.diagnostic.goto_prev()
		end,
		opts
	)

	vim.keymap.set("n",
		"<leader>a",
		function()
			vim.lsp.buf.code_action()
		end,
		opts
	)

	vim.keymap.set("n",
		"<leader>rn",
		function()
			vim.lsp.buf.rename()
		end,
		opts
	)

	vim.keymap.set("n",
		"<leader>fm",
		function()
			vim.lsp.buf.format({
				format_opts = {
					async = false,
				},
			})
			vim.cmd('w')
		end,
		opts
	)
end
