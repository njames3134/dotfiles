local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")

local nvim = require("config.nvim")
nvim.setup()

local plugins = {
	{ import = "plugins" },
	{ import = "plugins.appearance" },
	{ import = "plugins.language" },
	{ import = "plugins.lsp" },
	{ import = "plugins.navigation" },
	{ import = "plugins.status" },
	{ import = "plugins.utility" },
}

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "nightfox" },
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup(plugins, opts)


nvim.activate_theme()
