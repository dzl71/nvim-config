local opts = {
	ensure_installea = { "lua_ls", "rust_analyzer", "zls", "clangd", "pylsp" },
	automatic_enable = true,
}

local lua_ls = {
	settings = {
		Lua = {
			hint = {
				enable = true,
				arrayIndex = "Auto",
				await = true,
				paramName = "All",
				paramType = true,
				semicolon = "SameLine",
				setType = false,
			}
		}
	}
}

local rust_analyzer = {
	settings = {
		["rust_analyzer"] = {
			check = {
				command = "clippy",
			},
			inlayHints = {
				maxLength = 25,
				renderColons = true,
				bindingModeHints = {
					enable = false,
				},
				chainingHints = {
					enable = true,
				},
				closingBraceHints = {
					enable = true,
					minLines = 25,
				},
				closureReturnTypeHints = {
					enable = 'never',
				},
				lifetimeElisionHints = {
					enable = 'never',
					useParameterNames = false,
				},
				parameterHints = {
					enable = true,
				},
				reborrowHints = {
					enable = 'never',
				},
				typeHints = {
					enable = true,
					hideClosureInitialization = false,
					hideNamedConstructor = false,
				},
			},
		},
	},
}

local server_configs = {
	lua_ls = lua_ls,
	rust_analyzer = rust_analyzer,
}

local function keybinds(bufnr)

	vim.keymap.set(
		'n',
		'<leader>fm',
		function()
			vim.lsp.buf.format()
			vim.cmd("w")
		end,
		{ buffer = bufnr, desc = "format buffer", }
	)

	vim.keymap.set(
		'n',
		'<leader>a',
		function()
			vim.lsp.buf.code_action()
		end,
		{ buffer = bufnr, desc = "code actions", }
	)

	vim.keymap.set(
		'n',
		'<leader>e',
		function()
			vim.diagnostic.open_float()
		end,
		{ buffer = bufnr, desc = "show diagnostics", }
	)
	
	vim.keymap.set(
		'n',
		'<C-k>',
		function()
			vim.lsp.buf.signature_help()
		end,
		{ buffer = bufnr, desc = "function signature help", }
	)

	-- default nvim mappings
	-- K = hover (see docs)
	-- gd = go to defenition
	-- grn = rename
	-- grr = get references
	-- ]d = go to next diagnostic
	-- [d = go to previous diagnostic
end

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason.nvim",
		{ -- make lua_ls see vim global variables
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup(opts)
		for server, conf in ipairs(server_configs) do
			vim.lsp.config(server, conf)
		end
		keybinds(-1)
	end
}
