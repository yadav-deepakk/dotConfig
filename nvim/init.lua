-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.winborder = "rounded"
vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.loaded_netrw = 1  -- stop netrw from loading
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- keymaps
vim.keymap.set({ "v", "n" }, "<left>", "<cmd>lua print('use h key to move left')<cr>")
vim.keymap.set({ "v", "n" }, "<right>", "<cmd>lua print('use l key to move right')<cr>")
vim.keymap.set({ "v", "n" }, "<up>", "<cmd>lua print('use k key to move up')<cr>")
vim.keymap.set({ "v", "n" }, "<down>", "<cmd>lua print('use j key to move down')<cr>")

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
vim.keymap.set("n", "<leader>L", "<cmd>tabnew | terminal lazygit<cr>i")
vim.keymap.set("n", "<leader>ba", "<cmd>tab ba<cr>")

-- packages
vim.pack.add {

  { src = "https://github.com/sainnhe/everforest" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },

  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = "https://github.com/ibhagwan/fzf-lua" },

  -- lsps and completion
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = 'https://github.com/nvim-mini/mini.completion', version = 'stable' },

  { src = 'https://github.com/mfussenegger/nvim-jdtls' },

}

-- tui
vim.opt.background = "dark"
vim.g.everforest_background = "Hard"
vim.g.everforest_enable_italic = true
vim.g.everforest_transparent_background = 2
vim.cmd [[ colorscheme everforest ]]
local groups = { "Normal", "NormalNC", "NormalFloat", "FloatBorder" }
for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = 'none' })
end
require("lualine").setup({})


-- explorer, finders
require("mini.files").setup({})
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
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

-- lsp, parsers, code completions,
require("mason").setup({})
vim.lsp.enable({
  "vimls", "lua_ls", "bashls",
  "pyright", "ts_ls", "sqlls",
  "jdtls" -- for lombok support don't forget to add jvm-args (read the `:h lspconfig-all` jdtls config
})

-- diagnostic
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●",
    source = "if_many",
    severity = { min = vim.diagnostic.severity.HINT },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = true },
})

require("mini.completion").setup({})

-- autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.opt_local.number = true
    vim.keymap.set("n", "q", "<cmd>quit<cr>")
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HIGHLIGHT_YANK_GROUP", {}),
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ timeout = 80 })
  end
})

