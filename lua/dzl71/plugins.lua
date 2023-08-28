return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			local opts = require("dzl71.configs.treesitter")
			require('nvim-treesitter.install').compilers = { 'zig' }
			require('nvim-treesitter.configs').setup(opts)
		end
	},
	{
		'nvim-treesitter/playground'
	},
	{
		'mbbill/undotree'
	},
	{
		'tpope/vim-fugitive'
	},
	{
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
			require("dzl71.configs.lsp")
		end
	},
	{
		'simrat39/rust-tools.nvim',
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("dzl71.configs.indentation")
		end
	},
	-- {
	-- "jose-elias-alvarez/null-ls.nvim",
	-- config = function()
	-- require("dzl71.configs.null_ls")
	-- end,
	-- requires = { "nvim-lua/plenary.nvim" },
	-- },
}
