local function configured_undo_tree()
	return {
		"mbbill/undotree",
	}
end

vim.g.undotree_WindowLayout = 2
vim.g.undotree_SetFocusWhenToggle = 1

return configured_undo_tree()
