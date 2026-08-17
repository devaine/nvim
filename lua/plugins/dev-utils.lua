return {
	-- Parser that does syntax highlighting
	-- Make sure tree-sitter-cli is up-to-date!
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
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
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end
			})
		end
	},

	-- Allows pairs for {}, '', "", ()
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = function()
			local npairs = require('nvim-autopairs')
			npairs.setup({
				fast_wrap = {
					map = "<D-i>",
					chars = { '{', '[', '(', '"', "'" },
				}
			})
		end
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
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local newTerm = Terminal:new({
				direction = "float",
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-Space>", "<cmd>close<CR>", { noremap = true, silent = true })
				end,
				on_close = function()
					vim.cmd("startinsert!")
				end,
			})

			function _Term_toggle()
				newTerm:toggle()
			end

			vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>lua _Term_toggle()<CR>", { noremap = true, silent = true })
		end
	},

	-- Helps with finding environmental variables
	{
		"philosofonusus/ecolog.nvim",
		branch = "v1",
		lazy = false,
		keys = {
			{ '<leader>ge', '<cmd>EcologGoto<cr>',   desc = 'Go to env file' },
			{ '<leader>ep', '<cmd>EcologPeek<cr>',   desc = 'Ecolog peek variable' },
			{ '<leader>es', '<cmd>EcologSelect<cr>', desc = 'Switch env file' },
		},
		opts = {
			integrations = {
				blink_cmp = true
			}
		}
	},


	-- For Python mainly
	-- Allows
	{
		"linux-cultist/venv-selector.nvim",
		ft = "python",
		opts = {
			options = {},
			search = {}
		},
	}

}
