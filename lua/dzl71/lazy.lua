local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath
	})
end

-- add lazy to `runtimepath`, this allows us to `require` it.
vim.opt.rtp:prepend(lazypath)

-- set up lazy, and load plugins form the given directory
require("lazy").setup(
	{ import = "dzl71.plugins" },
	{
		change_detection = {
			notify = false,
		},
	}
)
