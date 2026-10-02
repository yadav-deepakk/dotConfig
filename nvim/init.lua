vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.netrw_winsize = 24
vim.g.netrw_liststyle = 3

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- keymaps
vim.keymap.set("n", "<left>", "<cmd>lua print('use h key to move left')<cr>")
vim.keymap.set("n", "<right>", "<cmd>lua print('use l key to move right')<cr>")
vim.keymap.set("n", "<up>", "<cmd>lua print('use k key to move up')<cr>")
vim.keymap.set("n", "<down>", "<cmd>lua print('use j key to move down')<cr>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<cr>i")
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | terminal<cr>i")

-- packages
vim.pack.add {
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
}

require("kanagawa").setup({ transparent = true })
vim.cmd[[ colorscheme kanagawa-wave ]] 

require("fzf-lua").setup({ 
	winopts = {
		height = 0.96,
		width = 0.92
	}
})
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua builtin<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua files cwd=~/.config<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")

