-----------------------------
-- options
-----------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 22
vim.opt.sidescrolloff = 10
vim.opt.updatetime = 225
vim.opt.timeoutlen = 350

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 23

-----------------------------
-- keymaps
-----------------------------
vim.keymap.set({"n", "v", "i"}, "<up>", "<cmd>lua print('WARN: use k to move up')<cr>")
vim.keymap.set({"n", "v", "i"}, "<down>", "<cmd>lua print('WARN: use j to move down')<cr>")
vim.keymap.set({"n", "v", "i"}, "<left>", "<cmd>lua print('WARN: use h to move left')<cr>")
vim.keymap.set({"n", "v", "i"}, "<right>", "<cmd>lua print('WARN: use l to move right')<cr>")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "Y", "\"+y")
vim.keymap.set("v", "x", "\"_x")
vim.keymap.set("v", "d", "\"_d")
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | terminal<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>botright 20split | terminal<cr>i")
vim.keymap.set("n", "<esc><esc>", "<cmd>nohl<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-----------------------------
-- vim packages
-----------------------------
vim.pack.add({
  -- ui
  { src = "hatps://github.com/rebelot/kanagawa.nvim", },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name="ibl", },
  -- finders
  { src = "hatps://github.com/ibhagwan/fzf-lua", },
  { src = "https://github.com/nvim-lua/plenary.nvim", }, -- dependency to harpoon
  { src = "https://github.com/ThePrimeagen/harpoon", },
  -- parser, lsp and completion
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main", },
  { src = "https://github.com/neovim/nvim-lspconfig", },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim", },
  { src = "https://github.com/mason-org/mason.nvim", },
  { src = "https://github.com/nvim-mini/mini.pairs", },
  { src = "https://github.com/nvim-mini/mini.completion", },
  -- debug adapters
  -- ai
})

-- ui
require("kanagawa").setup({transparent=true,theme="dragon"})
vim.cmd[[ colorscheme kanagawa ]]

-- finders
require("fzf-lua").setup({
  winopts = {
    width = 0.82,
    height = 0.96,
    preview = {
      default = "bat",
      layout = "vertical",
    },
  },
})
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>FzfLua files cwd=~/.config<cr>")
vim.keymap.set("n", "<leader><space>", "<cmd>FzfLua builtin<cr>")

-- lsp
require("ibl").setup({})
require("mini.pairs").setup({})
require("mini.completion").setup({})
require("mason").setup({ui={border="rounded"}})
local servers = { "vimls", "lua_ls", "ts_ls", "jdtls" }
require("mason-lspconfig").setup({ ensure_installed = servers })
vim.lsp.enable({
  servers = servers,
  on_attach = function(client, bufnr)
    require("mini.completion").on_attach(client, bufnr)
  end
})

-----------------------------
-- automcmds
-----------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YANK_GROUP", {}),
  pattern = "*",
  callback = function()
    vim.hl.on_yank({timeout=40})
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("DKY_GROUP", {}),
  pattern = "*",
  command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LSP_GROUP", {}),
  pattern = "*",
  callback = function()

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border="rounded"}) end)
    vim.keymap.set("n", "gra", "<cmd>FzfLua lsp_code_action<cr>")
    vim.keymap.set("n", "grr", "<cmd>FzfLua lsp_references<cr>")
    vim.keymap.set("n", "gri", "<cmd>FzfLua lsp_implementations<cr>")
    vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>")
    vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<cr>")
    vim.keymap.set("n", "g0", "<cmd>FzfLua lsp_document_symbols<cr>")
    vim.keymap.set("n", "g0", "<cmd>FzfLua lsp_workspace_symbols<cr>")
    vim.keymap.set("n", "g0", "<cmd>FzfLua lsp_document_diagnostics<cr>")

  end
})

