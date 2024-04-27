local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'zls',
	'clangd',
	'jdtls',
	'pylsp',
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
end)

lsp.skip_server_setup({ 'rust_analyzer' })


lsp.setup()

vim.g.zig_fmt_autosave = 0

lspconfig.pylsp.setup(
	require("dzl71.configs.lsp.pylsp")
)

lspconfig.lua_ls.setup(
	require("dzl71.configs.lsp.lua_ls")
)

-- enable inlayhints wherever it's supported
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})
