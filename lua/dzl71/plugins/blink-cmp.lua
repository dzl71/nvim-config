local opts = {
	keymap = { preset = 'enter' },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
		list = { selection = { preselect = true, auto_insert = false}, },
	},
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	appearance = { nerd_font_variant = 'mono' },
}

return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	opts = opts,
	opts_extend = { "sources.default" }
}
