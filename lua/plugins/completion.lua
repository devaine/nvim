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
				['<Tab>'] = { 'select_next', 'fallback' },
				['<S-Tab>'] = { 'select_prev', 'fallback' },
				["<CR>"] = { 'select_and_accept', 'fallback' },
				['<C-e>'] = { 'hide', 'fallback' }
			},

			completion = {
				documentation = {
					auto_show = true,
					treesitter_highlighting = true
				},
				menu = { auto_show = true },
				ghost_text = { enabled = true }
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" }
		}
	}
}
