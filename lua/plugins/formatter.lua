-- Formatter plugin, helps with formatting code on saving the file.

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" }, -- add stop_after_first for n > 1
			typescript = { "prettier" },
			sh = { "shfmt", "shellcheck" },
			bash = { "shfmt", "shellcheck" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback"
		}
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
