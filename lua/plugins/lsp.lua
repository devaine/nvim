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
				-- :MasonInstall shellcheck black shfmt
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
			--vim.diagnostic.config({ virtual_lines = true })
			--vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

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

			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "E501", "W503", "E265" },
							},
						},
					},
				},
			})

			local base_on_attach = vim.lsp.config.eslint.on_attach
			vim.lsp.config("pylsp", {
				on_attach = function(client, bufnr)
					if not base_on_attach then
						return
					end

					base_on_attach(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "LspEslintFixAll",
					})
				end,
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
				"eslint-lsp",
				"pyright",
			})
		end,
	},

	{
		"mfussenegger/nvim-jdtls",
		config = function()
			vim.lsp.config("jdtls", {
				settings = {
					java = {
						-- Custom eclipse.jdt.ls options go here
					},
				},
			})
			vim.lsp.enable("jdtls")
		end,
	},
}
