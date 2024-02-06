local telescope = require("telescope.builtin")

-- ********************************
-- *                              *
-- *   define utility funcitons   *
-- *                              *
-- ********************************

---@return boolean
local function not_exists(binding)
	if type(binding.modes) == "string" then
		if vim.fn.maparg(binding.name, binding.modes) ~= '' then
			print(string.format([[the "%s" binding in "%s" mode is duplicated]], binding.name, binding.modes))
			return false
		end
	else
		for _, mode in ipairs(binding.modes) do
			if vim.fn.maparg(binding.name, mode) ~= '' then
				print(string.format([[the "%s" binding in "%s" mode is duplicated]], binding.name, mode))
				return false
			end
		end
	end
	return true
end

---@param modes table|string
---@param name string
---@param action string|function
---@param opts table?
---@return table
local function bind(modes, name, action, opts)
	return {
		modes = modes,
		name = name,
		action = action,
		opts = opts,
	}
end

-- ************************************************
-- *                                              *
-- *    delete default conflicting keybindings    *
-- *                                              *
-- ************************************************

vim.keymap.del("n", '<C-l>')

-- ********************************
-- *                              *
-- *      define keybindings      *
-- *                              *
-- ********************************

local bindings = {

	-- utils

	bind( -- save file and exit modes
		"n",
		"<leader>n",
		vim.cmd.E
	),
	bind(
		{ "n", "v", "i", "c", "s" },
		"<C-s>",
		"<Esc><Cmd>noh<CR><Cmd>w<CR>"
	),
	bind( -- copy line to clippboard
		"n",
		"<leader>yy",
		'"+yy'
	),
	bind( -- coppy selected text to clippboard
		"v",
		"<leader>y",
		'"+y'
	),
	bind( -- paste a from clippboard
		"n",
		"<leader>p",
		'"+p'
	),
	bind( -- paste before cursor from clippboard
		"n",
		"<leader>P",
		'"+P'
	),
	bind( -- save the current item in the buffer after change
		"v",
		"<leader>p",
		[["_dP]]
	),
	bind( -- close current buffer
		"n",
		"<leader>x",
		"<Cmd>bd!<CR>"
	),

	-- telescope keybindings

	bind(
		'n',
		'<leader>ff',
		function() telescope.find_files({ hidden = true }) end,
		{}
	),
	bind( -- find text across all the files in a workspace
		'n',
		'<leader>gl',
		telescope.live_grep,
		{}
	),
	bind( -- find text in the current file/buffer
		'n',
		'<leader>/',
		telescope.current_buffer_fuzzy_find,
		{}
	),
	bind( -- search buffers
		'n',
		'<leader><Tab>',
		telescope.buffers,
		{}
	),
	bind(
		'n',
		'gr',
		telescope.lsp_references,
		{ buffer = true }
	),

	-- toggle and untoggle undotree

	bind(
		'n',
		'<leader>u',
		'<cmd>UndotreeToggle<cr>',
		{}
	),

	-- show vim fugitive

	bind(
		"n",
		"<leader>gi",
		vim.cmd.Git
	),

	-- window jumping

	bind( -- jump to lower window
		"n",
		"<C-j>",
		'<C-w>j'
	),
	bind( -- jump to upper window
		"n",
		"<C-k>",
		'<C-w>k'
	),
	bind( -- jump to righter window
		"n",
		"<C-l>",
		'<C-w>l'
	),
	bind( -- jump to lefter window
		"n",
		"<C-h>",
		'<C-w>h'
	),

	-- swap windows

	bind( -- swap with lower window
		"n",
		"<C-S-j>",
		'<C-w>J'
	),
	bind( -- swap with upper window
		"n",
		"<C-S-k>",
		'<C-w>K'
	),
	bind( -- swap with righter window
		"n",
		"<C-S-l>",
		'<C-w>L'
	),
	bind( -- swap with lefter window
		"n",
		"<C-S-h>",
		'<C-w>H'
	),

	-- moving the line of the selected text up and down

	bind(
		"v",
		"J",
		":m .+<CR>gv=gv"
	),
	bind(
		"v",
		"K",
		":m .-2<CR>gv=gv"
	),

	-- keeps the cursor at the middle of the screen when jumping up and down

	bind(
		"n",
		"<C-d>",
		"<C-d>zz"
	),
	bind(
		"n",
		"<C-u>",
		"<C-u>zz"
	),
	bind(
		"n",
		"G",
		"Gzz"
	),

	-- keeps the cursor in the middle while searching terms through "/"

	bind(
		"n",
		"n",
		"nzzzv"
	),
	bind(
		"n",
		"N",
		"Nzzzv"
	),

	-- open terminal in a new tab
	-- bind(
	-- "n",
	-- "<leader>t",
	-- ":edit term://bash<Cr>"
	-- )

	-- moving in insert mode

	bind( -- go down
		"i",
		"<C-j>",
		'<Down>'
	),
	bind( -- go up
		"i",
		"<C-k>",
		'<Up>'
	),
	bind( -- go right
		"i",
		"<C-l>",
		'<Right>'
	),
	bind( -- go left
		"i",
		"<C-h>",
		'<Left>'
	),
}

-- *****************************************
-- *                                       *
-- *    check for duplicate keybindings    *
-- *                                       *
-- *****************************************

for _, binding in ipairs(bindings) do
	if not_exists(binding) then
		vim.keymap.set(binding.modes, binding.name, binding.action, binding.opts)
	end
end
