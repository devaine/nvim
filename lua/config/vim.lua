-- set the leader
vim.g.mapleader = " "

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

-- keybinds
keybind("n", "<leader>hh", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "LSP Diagonistics" })

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
keybind("n", "<leader>mm", "<Cmd>Neotree toggle<CR>", { desc = "Toggle File Explorer" })
keybind("n", "<leader>jj", "<Cmd>Neotree action=focus<CR>", { desc = "Focus on file explorer" })

-- file handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.autoread = true
