local config = function()
	local cmp = require("cmp")

	local luasnip = require("luasnip")

	-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	require("luasnip.loaders.from_vscode").lazy_load()

	-- vim.keymap.set({ "i", "s" }, "<Tab>", function()
	-- 	luasnip.jump(1)
	-- end, { silent = true })
	-- vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	-- 	luasnip.jump(-1)
	-- end, { silent = true })

	cmp.setup({
		experimental = {
			ghost_text = true,
		},
		completion = {
			completeopt = "menu,menuone,preview,select",
		},
		snippet = { -- configure how nvim-cmp interacts with snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
			["<C-e>"] = cmp.mapping.abort(), -- close completion window
			["<Tab>"] = cmp.mapping.confirm({ select = false }),
		}),
		-- sources for autocompletion
		sources = cmp.config.sources({
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text within current buffer
			{ name = "path" }, -- file system paths
		}, {
			{ name = "buffer" },
		}),
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for cmdline completion
		"hrsh7th/cmp-copilot", -- source for copilot completion
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = config,
}
