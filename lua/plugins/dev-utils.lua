return {
	-- Parser that does syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"cpp",
					"java",
					"javascript",
					"bash",
					"python",
					"typescript",
					"css",
					"html",
					"jsdoc",
					"http",
					"sql",
					"ssh_config",
					"json",
					"tsx",
					"xml",
					"yaml",
					"nginx",
					"gitcommit",
					"gitignore",
					"cmake"
				},
				indent = { enable = true },
				highlight = { enable = true }
			})
		end
	},

	-- Allows pairs for {}, '', "", ()
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {}
	},

	-- Allows automatic tagging on HTML or JSON (E.g: <div>test</div> )
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Provides highlighting on TODO's, E.g:
	-- NOTE: This is a note.
	-- WARN: This is warning note.
	-- TODO: This is a to-do note.
	-- FIX: This is a fix note.
	-- PERF: This is a performance note.
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Allows highlighting for hexadecimal colors for RGB characters.
	-- E.g: #FFFFFF
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},

	-- Shows line(s) indicating indentation.
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- Floating terminal
	{
		"numToStr/FTerm.nvim",
		config = function()
			-- truly toggle floating terminal (auto closes floating terminal)
			-- thank you: https://github.com/numToStr/FTerm.nvim/issues/78#issuecomment-1432326116
			local function create_autocmd(pattern, key, term)
				vim.api.nvim_create_autocmd("FileType", {
					pattern = pattern,
					callback = function(event)
						local t = term
						vim.keymap.set("t", key, function() t:close() end, { buffer = event.buf, silent = true })
					end,
				})
			end

			local fterm = require("FTerm")
			fterm.setup({})
			create_autocmd("FTerm", "<C-Space>", fterm)
		end
	}
}
