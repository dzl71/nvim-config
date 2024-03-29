local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'zls',
	'clangd',
	'jdtls',
	--'pyright'
	'pylsp'
})

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>vm", function()
		for i = 1, 10, 1 do
			print(i)
		end
	end, opts)
	vim.keymap.set("n", "<leader>fm", function()
		vim.lsp.buf.format({
			format_opts = {
				async = false,
			},
		})
		vim.cmd('w')
	end, opts)
end)

lsp.setup()

lsp.skip_server_setup({ 'rust_analyzer' })

vim.g.zig_fmt_autosave = 0
-- vim.g.syntastic_python_checkers = { 'mypy' }
