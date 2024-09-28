------------------
-- center jumps --
------------------

vim.keymap.set(
	'n',
	"<C-d>",
	"<C-d>zz",
	{}
)

vim.keymap.set(
	'n',
	"<C-u>",
	"<C-u>zz",
	{}
)

vim.keymap.set(
	'n',
	"G",
	"Gzz",
	{}
)

vim.keymap.set(
	'n',
	"n",
	"nzzzv",
	{}
)

vim.keymap.set(
	'n',
	"N",
	"Nzzzv",
	{}
)
vim.keymap.set(
	'i',
	"<C-j>",
	'<Down>',
	{
		desc = "go down in insert mode",
	}
)

----------------------------
-- insert mode navigation --
----------------------------

vim.keymap.set(
	'i',
	"<C-k>",
	'<Up>',
	{
		desc = "go up in insert mode",
	}
)

vim.keymap.set(
	'i',
	"<C-l>",
	'<Right>',
	{
		desc = "go right in insert mode",
	}
)

vim.keymap.set(
	'i',
	"<C-h>",
	'<Left>',
	{
		desc = "go left in insert mode",
	}
)
