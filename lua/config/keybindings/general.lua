vim.keymap.set('n',
	'ZO',
	'ZQ',
	{
		desc = 'quit without saving',
	}
)
vim.keymap.set('v',
	"v",
	"<S-v>",
	{
		desc = "go to line-visual mode"
	}
)
vim.keymap.set('v',
	"<leader>y",
	'"+y',
	{
		desc = "coppy selected text to clippboard",
	}
)
vim.keymap.set('v',
	"<leader>p",
	[["_dP]],
	{
		desc = "save the current item in the buffer after change"
	}
)
vim.keymap.set('n',
	'<leader>u',
	'<cmd>UndotreeToggle<cr>',
	{
		desc = "toggle undo-tree",
	}
)
vim.keymap.set('n',
	"<leader>n",
	vim.cmd.Ex,
	{
		desc = "explore directory of current file",
	}
)
vim.keymap.set('n',
	"<leader>yy",
	'"+yy',
	{
		desc = "copy line to clippboard",
	}
)
vim.keymap.set('n',
	"<leader>p",
	'"+p',
	{
		desc = "paste a from clippboard",
	}
)
vim.keymap.set('n',
	"<leader>P",
	'"+P',
	{
		desc = "paste before cursor from clippboard",
	}
)
vim.keymap.set('n',
	"<leader>x",
	"<Cmd>bd!<CR>",
	{
		desc = "close current buffer",
	}
)
