-- neovim/vim variables
local opt = vim.opt
local keybind = vim.keymap.set

-- basic
opt.relativenumber = true
opt.number = true
opt.termguicolors = true

-- indentation
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2
opt.smarttab = true
opt.smartindent = true

-- searches
opt.incsearch = true

-- mapleader
vim.g.mapleader = " "

-- custom lua functions
local function toggle_diagnostics()
	local qf = vim.fn.getqflist({ winid = 0 })

	if qf.winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.diagnostic.setqflist({ open = true })
	end
end

-- keybinds
keybind("n", "<leader>hh", toggle_diagnostics, { desc = "LSP Diagonistics" })

-- buffer keybinds
keybind("n", "<leader>bb", "<cmd>bprevious<CR>", { desc = "Switch to previous buffer" })
keybind("n", "<leader>nn", "<cmd>bnext<CR>", { desc = "Switch to next buffer" })
keybind("n", "<leader>,,", "<cmd>bdel<CR>", { desc = "Delete Buffer" })

-- visual mode keybinds
keybind("v", "<leader>ii", '"+y', { desc = "Copy to clipboard ( + yank)" })
keybind("v", "<", "<gv", { desc = "Indent left and reselect" })
keybind("v", ">", ">gv", { desc = "Indent right and reselect" })
keybind("v", "<S-Up>", ":m '<-2<CR>gv", { desc = "Move selection up" })
keybind("v", "<S-Down>", ":m '>+1<CR>gv", { desc = "Move selection down" })

-- friend keybinds
keybind("i", "jk", "<Esc>", { desc = "Keybind set for Justin" })

-- file explorer
keybind("n", "<leader>mm", "<Cmd>Neotree toggle filesystem dir=%:p:h<CR>", { desc = "Toggle File Explorer" })
keybind("n", "<leader>jj", "<Cmd>Neotree action=focus<CR>", { desc = "Focus on file explorer" })

-- telescope.nvim (search.lua)
keybind("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find Files" })
keybind("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
keybind("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Show Buffers" })
keybind("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help Tags" })

-- venv select
keybind("n", ",v", "<Cmd>VenvSelect<CR>", { desc = "Finds the python venv" })

-- remote connection
keybind("n", "<leader>;;", "<CMD>RemoteStart<CR>")

-- open floating terminal
-- to see toggling, see: dev-utils.lua under toggleterm.nvim

-- wrap around pairs
-- see: dev-utils.lua under nvim-autopairs

-- file handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.autoread = true

-- custom functions
-- disable automatic commenting upon using <CR>
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.formatoptions:remove("r")
	end,
})
