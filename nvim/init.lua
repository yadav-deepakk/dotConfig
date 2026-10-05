vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 15
vim.opt.showmode = false

vim.g.netrw_winsize = 24
vim.g.netrw_liststyle = 3

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- keymaps
vim.keymap.set({"v", "n"}, "<left>", "<cmd>lua print('use h key to move left')<cr>")
vim.keymap.set({"v", "n"}, "<right>", "<cmd>lua print('use l key to move right')<cr>")
vim.keymap.set({"v", "n"}, "<up>", "<cmd>lua print('use k key to move up')<cr>")
vim.keymap.set({"v", "n"}, "<down>", "<cmd>lua print('use j key to move down')<cr>")

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "<s-tab>", "<gv")
vim.keymap.set("v", "Y", '"+y')

vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<cr>i")
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | terminal<cr>i")
vim.keymap.set("n", "<leader>lg", "<cmd>tabnew | terminal lazygit<cr>i")

-- packages
vim.pack.add {

	{ src = 'https://github.com/navarasu/onedark.nvim'},

	{ src = 'https://github.com/nvim-mini/mini.files'},
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = 'https://github.com/nvim-mini/mini.completion', version = 'stable' },

}

-- tui
require("onedark").setup({ style='darker', transparent = true })
require("onedark").load()
vim.cmd("colorscheme onedark")

-- finders
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

-- lsp, liners, parsers, code completions, 
require("mason").setup({ ui = { border = "rounded" } })
vim.lsp.enable({
	"lua_ls", "vimls",
	"pyright", "ts_ls",
	"sqlls",
	"jdtls",
})
require("mini.completion").setup({})

