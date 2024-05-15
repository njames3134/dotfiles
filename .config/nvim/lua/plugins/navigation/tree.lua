return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	git = { enable = false },
	config = {
		filters = {
			dotfiles = false,
		},
		renderer = {
			root_folder_modifier = ":t",
			icons = {
				show = { git = false },
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
	},
}
