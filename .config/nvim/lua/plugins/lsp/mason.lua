local config = function()
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")

	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"clangd", -- c, c++
			"tsserver", -- javascript, typescript
			"jdtls", -- java
			"html", -- html
			"cssls", --css
			"lua_ls", --lua
			"pyright", --python
			"dockerls", --docker
			"bashls", --shell
		},
		-- auto-install configured servers (with lspconfig)
		automatic_installation = true, -- not the same as ensure_installed
	})

	mason_tool_installer.setup({
		-- list of tools for mason to install
		ensure_installed = {
			--formatters
			"prettier", -- c, c#, c++, json, java, javascript formatter
			"stylua", -- lua formatter
			"isort", -- python formatter
			"black", -- python formatter
			"shfmt", -- bash, mksh, shell formatter

			-- linters
			"cpplint", -- c, c++ linter
			"eslint_d", -- js linter
			"luacheck", -- lua linter
			"pylint", -- python linter
			"shellcheck", -- bash linter
		},
	})
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	cmd = "Mason",
	event = "BufReadPre",
	config = config,
}
