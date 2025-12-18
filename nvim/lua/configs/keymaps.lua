vim.g.mapleader=" "
vim.g.maplocalleader=","
vim.g.netrw_liststyle=3
vim.g.netrw_browse_split=0
vim.g.netrw_winsize=25

-- disable arrow key movements
vim.keymap.set({"n", "v", "i"}, "<right>", "<cmd>lua print('WARN: press l to move right')<cr>")
vim.keymap.set({"n", "v", "i"}, "<left>", "<cmd>lua print('WARN: press h to move left')<cr>")
vim.keymap.set({"n", "v", "i"}, "<down>", "<cmd>lua print('WARN: press j to move down')<cr>")
vim.keymap.set({"n", "v", "i"}, "<up>", "<cmd>lua print('WARN: press k to move up')<cr>")

-- window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- buffer/netrw operations
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | terminal<cr>i")
vim.keymap.set("n", "<leader>tt", "<cmd>botright20 split | terminal<cr>i")
vim.keymap.set("n", "<leader>ba", "<cmd>tab ba<cr>")
vim.keymap.set("n", "<leader>dd", "<cmd>bd<cr>")

-- indent text in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- other useful maps
vim.keymap.set("n", "<esc>", "<cmd>nohl<cr>")
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("v", "x", "\"_x")
vim.keymap.set("v", "d", "\"_d")

