local M = {}

function M.setup()
	require("config.options").setup()
end

function M.activate_theme()
	local options = require("config.options")
	local theme = options.theme

	local themes = require("config.theming.themes")
	themes.activate_theme(theme.name, theme.style, theme.transparent)
end

return M
