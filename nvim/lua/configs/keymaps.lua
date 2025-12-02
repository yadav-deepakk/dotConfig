vim.g.mapleader=" "
vim.g.maplocalleader=","
vim.g.netrw_liststyle=3

-- disable arrow key movements 
vim.keymap.set({"n", "t", "v", "i"}, "<right>", "<cmd>lua print('press l to move right')<cr>")
vim.keymap.set({"n", "t", "v", "i"}, "<left>", "<cmd>lua print('press h to move left')<cr>")
vim.keymap.set({"n", "t", "v", "i"}, "<down>", "<cmd>lua print('press j to move down')<cr>")
vim.keymap.set({"n", "t", "v", "i"}, "<up>", "<cmd>lua print('press k to move up')<cr>")

-- window operations
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<leader>wh", "<c-w>s")
vim.keymap.set("n", "<leader>wv", "<c-w>v")
vim.keymap.set("n", "<leader>wt", "<c-w>T")
vim.keymap.set("n", "<leader>wo", "<c-w>o")
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>")

-- buffer/netrw operations
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>ba", "<cmd>tab ba<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>ww", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>ws", "<cmd>w!<cr><cmd>so<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>wqa!<cr>")
vim.keymap.set("n", "<leader>qa", "<cmd>qa!<cr>")

-- indent text in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- other useful maps
vim.keymap.set("n", "<esc>", "<cmd>nohl<cr>")
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "d", '"_d')

vim.keymap.set("n", "<leader>H", "<cmd>help<cr>")
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>")
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>terminal<cr>")

