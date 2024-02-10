local telescope = require("telescope.builtin")

-- ********************************
-- *                              *
-- *       define funcitons       *
-- *                              *
-- ********************************

---define the keybinding "struct"
---@param modes table|string
---@param name string
---@param action string|function
---@param opts table?
---@return table
local function bind(name, action, opts, modes)
	return {
		modes = modes,
		name = name,
		action = action,
		opts = opts,
	}
end

---check if a keybining was already set in the same mode?
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

---set the keybindings
---@param bindings table
local function set_bindings(bindings)
	for _, binding in ipairs(bindings) do
		if not_exists(binding) then
			vim.keymap.set(binding.modes, binding.name, binding.action, binding.opts)
		end
	end
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

-- bind(
--     "<binding name>",
--     "<action>",
--     "<extra options>",
--     "<mode>"
--  ),

local bindings = {

	-- utils

	bind(
		"<leader>n",
		vim.cmd.E,
		{},
		"n"
	),
	-- bind( -- save file and exit modes
	-- 	"<C-s>",
	-- 	"<Esc><Cmd>noh<CR><Cmd>w<CR>",
	-- 	{},
	-- 	{ "n", "v", "i", "c", "s" }
	-- ),
	bind( -- copy line to clippboard
		"<leader>yy",
		'"+yy',
		{},
		"n"
	),
	bind( -- coppy selected text to clippboard
		"<leader>y",
		'"+y',
		{},
		"v"
	),
	bind( -- paste a from clippboard
		"<leader>p",
		'"+p',
		{},
		"n"
	),
	bind( -- paste before cursor from clippboard
		"<leader>P",
		'"+P',
		{},
		"n"
	),
	bind( -- save the current item in the buffer after change
		"<leader>p",
		[["_dP]],
		{},
		"v"
	),
	bind( -- close current buffer
		"<leader>x",
		"<Cmd>bd!<CR>",
		{},
		"n"
	),

	-- telescope keybindings

	bind( -- find files
		'<leader>ff',
		function() telescope.find_files({ hidden = true }) end,
		{},
		'n'
	),
	bind( -- find text across all the files in a workspace
		'<leader>gl',
		telescope.live_grep,
		{},
		'n'
	),
	bind( -- find text in the current file/buffer
		'<leader>/',
		telescope.current_buffer_fuzzy_find,
		{},
		'n'
	),
	bind( -- search buffers
		'<leader><Tab>',
		telescope.buffers,
		{},
		'n'
	),
	bind( -- go to references
		'gr',
		telescope.lsp_references,
		{ buffer = true },
		'n'
	),

	-- toggle and untoggle undotree

	bind(
		'<leader>u',
		'<cmd>UndotreeToggle<cr>',
		{},
		'n'
	),

	-- show vim fugitive

	bind(
		"<leader>gi",
		vim.cmd.Git,
		{},
		"n"
	),

	-- window jumping

	bind( -- jump to lower window
		"<C-j>",
		'<C-w>j',
		{},
		"n"
	),
	bind( -- jump to upper window
		"<C-k>",
		'<C-w>k',
		{},
		"n"
	),
	bind( -- jump to righter window
		"<C-l>",
		'<C-w>l',
		{},
		"n"
	),
	bind( -- jump to lefter window
		"<C-h>",
		'<C-w>h',
		{},
		"n"
	),

	-- swap windows

	bind( -- swap with lower window
		"<C-S-j>",
		'<C-w>J',
		{},
		"n"
	),
	bind( -- swap with upper window
		"<C-S-k>",
		'<C-w>K',
		{},
		"n"
	),
	bind( -- swap with righter window
		"<C-S-l>",
		'<C-w>L',
		{},
		"n"
	),
	bind( -- swap with lefter window
		"<C-S-h>",
		'<C-w>H',
		{},
		"n"
	),

	-- moving the line of the selected text up and down

	bind(
		"J",
		":m .+<CR>gv=gv",
		{},
		"v"
	),
	bind(
		"K",
		":m .-2<CR>gv=gv",
		{},
		"v"
	),

	-- keeps the cursor at the middle of the screen when jumping up and down

	bind(
		"<C-d>",
		"<C-d>zz",
		{},
		"n"
	),
	bind(
		"<C-u>",
		"<C-u>zz",
		{},
		"n"
	),
	bind(
		"G",
		"Gzz",
		{},
		"n"
	),

	-- keeps the cursor in the middle while searching terms through "/"

	bind(
		"n",
		"nzzzv",
		{},
		"n"
	),
	bind(
		"N",
		"Nzzzv",
		{},
		"n"
	),

	-- open terminal in a new tab
	-- bind(
	-- "<leader>t",
	-- ":edit term://bash<Cr>",
	-- {},
	-- "n"
	-- )

	-- moving in insert mode

	bind( -- go down
		"<C-j>",
		'<Down>',
		{},
		"i"
	),
	bind( -- go up
		"<C-k>",
		'<Up>',
		{},
		"i"
	),
	bind( -- go right
		"<C-l>",
		'<Right>',
		{},
		"i"
	),
	bind( -- go left
		"<C-h>",
		'<Left>',
		{},
		"i"
	),
}

-- *****************************************
-- *                                       *
-- *           set keybindings             *
-- *                                       *
-- *****************************************

set_bindings(bindings)
