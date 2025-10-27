-- Formatter plugin, helps with formatting code on saving the file.

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" }, -- add stop_after_first for n > 1
			typescript = { "prettier" },
			sh = { "shfmt", "shellcheck" },
			bash = { "shfmt", "shellcheck" },
		},
		formatters = {
			prettier = {
				prepend_args = function()
					return { "" }
				end,
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},

	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
