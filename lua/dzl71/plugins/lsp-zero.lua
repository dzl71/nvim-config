local function configured_lsp_zero(opts)
	return {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },         -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },     -- Required
			{ 'L3MON4D3/LuaSnip' },         -- Required
		},
		config = function()
			require("dzl71.plugins.lsp.lsp-setup")
		end
	}
end

local opts = {}

return configured_lsp_zero(opts)
