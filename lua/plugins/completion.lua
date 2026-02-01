return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config

		opts = {
			keymap = {
				preset = "none",
				["<Tab>"] = {
					function(cmp)
						local cursor_pos = vim.api.nvim_win_get_cursor(0)
						local col = cursor_pos[2]
						local current_line = vim.api.nvim_get_current_line()

						if cmp.is_menu_visible() then
							cmp.select_next()
							return
						end

						if current_line:sub(col, col) == "." then
							if not cmp.is_menu_visible() then
								cmp.show()
								return
							end
						end
						return "\t"
					end,
				},
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},

			completion = {
				trigger = {
					show_on_x_blocked_trigger_characters = { "." },
				},
				documentation = {
					auto_show = true,
					treesitter_highlighting = true,
				},
				menu = { auto_show = true },
				ghost_text = { enabled = true },
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				min_keyword_length = 0,
			},

			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
}
