return {
	{
		"mbbill/undotree",
		config = function()
			require('dzl71.configs.undotree')
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require("telescope").setup()
		end
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
			--require('nvim-treesitter.install').compilers = { 'zig' }
			require('nvim-treesitter.configs').setup(opts)
		end
	},
	{
		'nvim-treesitter/playground'
	},
	{
		'tpope/vim-fugitive'
	},
	{
		'simrat39/rust-tools.nvim',
		ft = "rust",
		config = function()
			require('rust-tools').setup(
				require 'dzl71.configs.rust_tools'
			)
		end
	},
	{
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
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
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("dzl71.configs.indentation")
		end
	},
	{
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup {
				-- configuration here
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								--work = "~/notes/work",
								--home = "~/notes/home",
								home = "~/notes",
							}
						}
					}
				}
			}
		end,
	},
}
