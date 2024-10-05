local lsp = require('lsp-zero')
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'zls',
	'clangd',
	'jdtls',
	'pylsp', -- python
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
	vim.lsp.inlay_hint.enable(true)
	-- make the LspInlayHint color to comment color
	vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#727169' })

	require("config.keybindings.plugins.lsp")(opts)

end)

-- lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()

vim.g.zig_fmt_autosave = 0

-- lspconfig.pylsp.setup(
-- 	require("plugins.lsp.pylsp")
-- )

lspconfig.lua_ls.setup(
	require("plugins.lsp.lua_ls")
)

lspconfig.rust_analyzer.setup(
	require("plugins.lsp.rust_analyzer")
)
