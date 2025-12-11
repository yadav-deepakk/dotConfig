-----------------------------
-- options
-----------------------------
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 10
vim.opt.updatetime = 220
vim.opt.timeoutlen = 350

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-----------------------------
-- keymaps
-----------------------------
vim.keymap.set("n", "<up>", "<cmd>lua print('WARN: use k to move up')<cr>")
vim.keymap.set("n", "<down>", "<cmd>lua print('WARN: use j to move down')<cr>")
vim.keymap.set("n", "<left>", "<cmd>lua print('WARN: use h to move left')<cr>")
vim.keymap.set("n", "<right>", "<cmd>lua print('WARN: use l to move right')<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>vsplit | terminal<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>tab | terminal<cr>")
vim.keymap.set("n", "<esc><esc>", "<cmd>nohl<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-----------------------------
-- vim packages
-----------------------------
vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim", },
  { src = "https://github.com/ibhagwan/fzf-lua", },
  { src = "https://github.com/neovim/nvim-lspconfig", },
  { src = "https://github.com/echasnovski/mini.completion", },
})

require("kanagawa").setup({transparent=true,theme="dragon"})
vim.cmd[[ colorscheme kanagawa ]]

require("fzf-lua").setup({
  winopts = {
    width = 0.88,
    height = 0.94,
    preview = {
      default = "bat",
      layout = "vertical",
    },
  },
})
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua files cwd=~/.config<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>")
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua builtin<cr>")

require("mini.completion").setup({ })

-----------------------------
-- automcmds
-----------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YANK_GROUP",{}),
  pattern = "*",
  callback = function()
    vim.hl.on_yank({timeout=50})
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("DKY_GROUP",{}),
  pattern = "*",
  command = [[%s/\s\+$//e]]
})

