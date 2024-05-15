local keymap = vim.keymap

local config = function()
	require("harpoon").setup({})
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")
	keymap.set("n", "<leader>a", mark.add_file)
	keymap.set("n", "<leader>h", ":Telescope harpoon marks<CR>")
	keymap.set("n", "<leader>n", function()
		ui.nav_next()
	end)
	keymap.set("n", "<leader>p", function()
		ui.nav_prev()
	end)
end

return {
	"theprimeagen/harpoon",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
