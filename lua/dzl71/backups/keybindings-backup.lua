local telescope = require("telescope.builtin")

-- ********************************
-- *                              *
-- *       define funcitons       *
-- *                              *
-- ********************************


---set the keybindings
---@param bindings table
local function set_bindings(bindings)
	for mode, mode_bindings in pairs(bindings) do
		for _, binding in ipairs(mode_bindings) do
			if vim.fn.maparg(binding.mapping, mode) ~= '' then
				print(string.format([[the "%s" binding in "%s" mode is duplicated]], binding.mapping, mode))
			else
				vim.keymap.set(mode, binding.mapping, binding.action, binding.opts)
			end
		end
	end
end

---define the keybinding "struct"
---@param mapping string
---@param action string|function
---@param opts table?
---@return table
local function bind(mapping, action, opts)
	return {
		mapping = mapping,
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

-- bind(
--     "<binding name>",
--     "<action>",
--     "<extra options>",
--  ),

local bindings = {}

bindings['n'] = {
	-- utils
	bind(
		'<leader>u',
		'<cmd>UndotreeToggle<cr>',
		{
			desc = "toggle undo-tree"
		}
	),
	bind(
		"<leader>n",
		vim.cmd.E,
		{}
	),
	bind(
		"<leader>yy",
		'"+yy',
		{
			desc = "copy line to clippboard"
		}
	),
	bind(
		"<leader>p",
		'"+p',
		{
			desc = "paste a from clippboard"
		}
	),
	bind(
		"<leader>P",
		'"+P',
		{
			desc = "paste before cursor from clippboard"
		}
	),
	bind(
		"<leader>x",
		"<Cmd>bd!<CR>",
		{
			desc = "close current buffer"
		}
	),
	-- telescope
	bind(
		'<leader>ff',
		function() telescope.find_files({ hidden = true }) end,
		{
			desc = "find files"
		}
	),
	bind(
		'<leader>gl',
		telescope.live_grep,
		{
			desc = "find text across all the files in a workspace"
		}
	),
	bind(
		'<leader>/',
		telescope.current_buffer_fuzzy_find,
		{
			desc = "find text in the current file/buffer"
		}
	),
	bind(
		'<leader><Tab>',
		telescope.buffers,
		{
			desc = "search buffers"
		}
	),
	bind(
		'gr',
		telescope.lsp_references,
		{
			buffer = true,
			desc = "go to references"
		}
	),
	-- window navigations
	bind(
		"<C-j>",
		'<C-w>j',
		{
			desc = "jump to lower window"
		}
	),
	bind(
		"<C-k>",
		'<C-w>k',
		{
			desc = "jump to upper window"
		}
	),
	bind(
		"<C-l>",
		'<C-w>l',
		{
			desc = "jump to righter window"
		}
	),
	bind(
		"<C-h>",
		'<C-w>h',
		{
			desc = "jump to lefter window"
		}
	),
	-- window focusing
	bind(
		"<C-S-j>",
		'<C-w>J',
		{
			desc = "swap with lower window"
		}
	),
	bind(
		"<C-S-k>",
		'<C-w>K',
		{
			desc = "swap with upper window"
		}
	),
	bind(
		"<C-S-l>",
		'<C-w>L',
		{
			desc = "swap with righter window"
		}
	),
	bind(
		"<C-S-h>",
		'<C-w>H',
		{
			desc = "swap with lefter window"
		}
	),
	-- centered navigation
	bind(
		"<C-d>",
		"<C-d>zz",
		{}
	),
	bind(
		"<C-u>",
		"<C-u>zz",
		{}
	),
	bind(
		"G",
		"Gzz",
		{}
	),
	bind(
		"n",
		"nzzzv",
		{}
	),
	bind(
		"N",
		"Nzzzv",
		{}
	),
}

bindings['v'] = {
	bind(
		"<leader>y",
		'"+y',
		{
			desc = "coppy selected text to clippboard"
		}
	),
	bind(
		"<leader>p",
		[["_dP]],
		{
			desc = "save the current item in the buffer after change"
		}
	),
	bind(
		"J",
		":m .+<CR>gv=gv",
		{}
	),
	bind(
		"K",
		":m .-2<CR>gv=gv",
		{}
	),
}

bindings['i'] = {
	bind(
		"<C-j>",
		'<Down>',
		{
			desc = "go down in insert mode"
		}
	),
	bind(
		"<C-k>",
		'<Up>',
		{
			desc = "go up in insert mode"
		}
	),
	bind(
		"<C-l>",
		'<Right>',
		{
			desc = "go right in insert mode"
		}
	),
	bind(
		"<C-h>",
		'<Left>',
		{
			desc = "go left in insert mode"
		}
	),
}

-- *****************************************
-- *                                       *
-- *           set keybindings             *
-- *                                       *
-- *****************************************

set_bindings(bindings)
