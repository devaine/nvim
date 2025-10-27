return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
		},
		opts = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				-- Ensure the install of these language servers
				ensure_installed = {
					"lua_ls",
					"clangd",
					"bashls",
					"ts_ls",
					"cssls",
					"html",
					"tailwindcss",
					"pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local caps = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities(caps)
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("ts_ls", {
				init_options = { preferences = { disableSuggestions = false } },
			})

			vim.lsp.enable({
				"lua_ls",
				"clangd",
				"bashls",
				"ts_ls",
				"cssls",
				"html",
				"tailwindcss",
				"pylsp",
			})
		end,
	},

	{
		"esmuellert/nvim-eslint",
		config = function()
			require("nvim-eslint").setup({
				settings = {
					workingDirectory = function(bufnr)
						return { directory = vim.fs.root(bufnr, { "package.json" }) }
					end,
				},
			})
		end,
	},
}
