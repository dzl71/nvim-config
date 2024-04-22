local telescope = require("telescope.builtin")

-- utils
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
	vim.cmd.E,
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

-- telescope
vim.keymap.set('n',
	'<leader>ff',
	function() telescope.find_files({ hidden = true }) end,
	{
		desc = "find files",
	}
)
vim.keymap.set('n',
	'<leader>gl',
	telescope.live_grep,
	{
		desc = "find text across all the files in a workspace",
	}
)
vim.keymap.set('n',
	'<leader>/',
	telescope.current_buffer_fuzzy_find,
	{
		desc = "find text in the current file/buffer",
	}
)
vim.keymap.set('n',
	'<leader><Tab>',
	telescope.buffers,
	{
		desc = "search buffers",
	}
)
vim.keymap.set('n',
	'gr',
	telescope.lsp_references,
	{
		buffer = true,
		desc = "go to references",
	}
)

-- window navigation
vim.keymap.set('n',
	"<C-j>",
	'<C-w>j',
	{
		desc = "jump to lower window",
	}
)
vim.keymap.set('n',
	"<C-k>",
	'<C-w>k',
	{
		desc = "jump to upper window",
	}
)
vim.keymap.set('n',
	"<C-l>",
	'<C-w>l',
	{
		desc = "jump to righter window",
	}
)
vim.keymap.set('n',
	"<C-h>",
	'<C-w>h',
	{
		desc = "jump to lefter window",
	}
)

-- window swapping
vim.keymap.set('n',
	"<C-S-j>",
	'<C-w>J',
	{
		desc = "swap with lower window",
	}
)
vim.keymap.set('n',
	"<C-S-k>",
	'<C-w>K',
	{
		desc = "swap with upper window",
	}
)
vim.keymap.set('n',
	"<C-S-l>",
	'<C-w>L',
	{
		desc = "swap with righter window",
	}
)
vim.keymap.set('n',
	"<C-S-h>",
	'<C-w>H',
	{
		desc = "swap with lefter window",
	}
)

-- centered navigation
vim.keymap.set('n',
	"<C-d>",
	"<C-d>zz",
	{}
)
vim.keymap.set('n',
	"<C-u>",
	"<C-u>zz",
	{}
)
vim.keymap.set('n',
	"G",
	"Gzz",
	{}
)
vim.keymap.set('n',
	"n",
	"nzzzv",
	{}
)
vim.keymap.set('n',
	"N",
	"Nzzzv",
	{}
)

-- text movement
vim.keymap.set('v',
	"J",
	":m .+<CR>gv=gv",
	{}
)
vim.keymap.set('v',
	"K",
	":m .-2<CR>gv=gv",
	{}
)

-- insert mode motions
vim.keymap.set('i',
	"<C-j>",
	'<Down>',
	{
		desc = "go down in insert mode",
	}
)
vim.keymap.set('i',
	"<C-k>",
	'<Up>',
	{
		desc = "go up in insert mode",
	}
)
vim.keymap.set('i',
	"<C-l>",
	'<Right>',
	{
		desc = "go right in insert mode",
	}
)
vim.keymap.set('i',
	"<C-h>",
	'<Left>',
	{
		desc = "go left in insert mode",
	}
)

vim.keymap.set('n',
	"<leader>t",
	'<cmd>term<cr>',
	{
		desc = "open builtin terminal",
	}
)
