----------------------------
-- options
----------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.exrc = true

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

vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.pumborder = 'rounded'
vim.opt.winblend = 0
vim.opt.pumblend = 0

vim.g.loaded_netrw = 1
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

---------------------------
-- keymaps
---------------------------
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "<s-tab>", "<gv")
vim.keymap.set("v", "Y", '"+y')
vim.keymap.set("v", "d", '"_d')

vim.keymap.set("n", "ciq", "ci'")
vim.keymap.set("n", "ciQ", 'ci"')

vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>botright split | terminal<cr>i")
vim.keymap.set("n", "<leader>T", "<cmd>tabnew | terminal<cr>i")
vim.keymap.set("n", "<leader>L", "<cmd>tabnew | terminal lazygit<cr>i")
vim.keymap.set("n", "<leader>ba", "<cmd>tab ba<cr>")

--------------------------
-- packages
--------------------------
vim.pack.add {

  { src = 'https://github.com/sainnhe/everforest' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },

  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },

  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',          version = 'main' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },

  { src = 'https://github.com/nvim-mini/mini.completion',                version = 'stable' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },

  { src = 'https://github.com/mfussenegger/nvim-jdtls' },

  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/wojciech-kulik/xcodebuild.nvim' },

}

------------------------
-- Appearance
------------------------
local MiniIcons = require('mini.icons')
MiniIcons.setup()
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()
vim.opt.background = 'dark'
vim.g.everforest_background = 'Soft'
vim.g.everforest_enable_italic = true
vim.g.everforest_transparent_background = 2
vim.cmd.colorscheme('everforest')
local groups = {
  'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'FloatTitle', 'FloatFooter',
  'PmenuKind', 'Pmenu', 'PmenuKind', 'PmenuExtra',
}
for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = 'none' })
end
require('lualine').setup({})

-------------------------------
-- finders
-------------------------------
require('mini.files').setup({})
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>')
require('fzf-lua').setup({
  winopts = {
    height = 0.94,
    width = 0.84,
    preview = {
      layout = 'vertical'
    }
  }
})
vim.keymap.set('n', '<leader><space>', '<cmd>FzfLua builtin<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua files cwd=~/.config<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>')

------------------------------
-- lsp, parsers, completions
------------------------------
require('nvim-treesitter').install({
  'html', 'css', 'javascript', 'typescript', 'tsx',
  'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
  'json', 'yaml', 'xml', 'properties', 'sql', 'bash',
  'java', 'swift'
})
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TREESITTER_START_GROUP', { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls', 'eslint', 'html', 'cssls', 'emmet_language_server', -- react
    'jdtls',                                                     -- spring boot (java)
    'jsonls', 'yamlls',                                          -- package.json, application.yml
    'lua_ls', 'bashls', 'sqlls',
    'pyright',
  },
  automatic_enable = false,
})
require('mason-tool-installer').setup({
  ensure_installed = {
    'prettierd', 'prettier', 'stylua',
    'java-debug-adapter', 'java-test',
  },
})

vim.lsp.enable({
  'ts_ls', 'eslint', 'html', 'cssls', 'emmet_language_server', -- react
  'jdtls', 'jsonls', 'yamlls',
  'sqlls', 'vimls', 'lua_ls', 'bashls',
  'pyright', 'sourcekit',
})
require('nvim-autopairs').setup({})
require('nvim-ts-autotag').setup({})
require('mini.completion').setup({})

-- xcode related build
require('xcodebuild').setup({})

-------------------------------
-- lsp diagnostics
-------------------------------
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = '●',
    source = 'if_many',
    severity = { min = vim.diagnostic.severity.HINT },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = true },
})

-------------------------------
-- autocmds
-------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HIGHLIGHT_YANK_GROUP', {}),
  pattern = '*',
  callback = function()
    vim.hl.on_yank({ timeout = 80 })
  end
})

-- before writing remove trailing spaces and format(if lsp supports it)
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('PRE_WRITE_GROUP', {}),
  pattern = '*',
  callback = function()
    vim.cmd([[ %s/\s\+$//e ]]) -- remove spaces
    local ft = vim.bo.filetype
    local exclude_langs = { http = true, rest = true }
    if not ft or ft == '' or exclude_langs[ft] then
      return
    end
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client:supports_method('textDocument/formatting') then
        vim.lsp.buf.format({ bufnr = 0 })
        break
      end
    end
  end
})

-- LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('LSP_ATTACH_GROUP', {}),
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gO', function() vim.lsp.buf.document_symbol() end, opts)
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
  end,
})
