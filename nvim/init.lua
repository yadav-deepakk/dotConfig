-------------------
-- variables
-------------------
local g = vim.g
local opt = vim.opt
local api = vim.api
local keymap = vim.keymap.set

-------------------
-- options
-------------------
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.swapfile = false
opt.exrc = true

opt.scrolloff = 15
opt.sidescrolloff = 8

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }

opt.termguicolors = true
opt.winborder = "rounded"
opt.pumborder = 'rounded'
opt.winblend = 0
opt.pumblend = 0

g.loaded_netrw = 1
g.have_nerd_font = true
g.mapleader = " "
g.maplocalleader = "\\"

----------------------
-- keymaps
----------------------
keymap("n", "<c-h>", "<c-w>h")
keymap("n", "<c-j>", "<c-w>j")
keymap("n", "<c-k>", "<c-w>k")
keymap("n", "<c-l>", "<c-w>l")

keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>")
keymap("t", "<esc><esc>", "<c-\\><c-n>")
keymap("v", "<tab>", ">gv")
keymap("v", "<s-tab>", "<gv")
keymap("v", "Y", '"+y')
keymap("v", "d", '"_d')

keymap("n", "<leader>q", "<cmd>quit<cr>")
keymap("n", "<leader>w", "<cmd>update<cr>")
keymap("n", "<leader>tt", "<cmd>botright split | terminal<cr>i")
keymap("n", "<leader>T", "<cmd>tabnew | terminal<cr>i")
keymap("n", "<leader>L", "<cmd>tabnew | terminal lazygit<cr>i")
keymap("n", "<leader>ba", "<cmd>tab ba<cr>")

--------------------
-- packages
--------------------
vim.pack.add {

  -- appearance
  { src = 'https://github.com/sainnhe/everforest' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/kevinhwang91/nvim-hlslens' },

  -- finders
  { src = 'https://github.com/nvim-mini/mini.files' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },

  -- lsp, parsers, lsp-configs installations
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',          version = 'main' },

  -- completions
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
  { src = 'https://github.com/nvim-mini/mini.completion',                version = 'stable' },

  -- plugins for developer convenience
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
  { src = 'https://github.com/artemave/workspace-diagnostics.nvim' },

  -- xcodebuild related plugins
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/wojciech-kulik/xcodebuild.nvim' },

}

---------------------
-- appearance
---------------------
local MiniIcons = require('mini.icons')
MiniIcons.setup()
MiniIcons.mock_nvim_web_devicons()
MiniIcons.tweak_lsp_kind()
opt.background = 'dark'
g.everforest_background = 'Soft'
g.everforest_enable_italic = true
g.everforest_transparent_background = 2
vim.cmd.colorscheme('everforest')
local groups = {
  'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'FloatTitle', 'FloatFooter',
  'PmenuKind', 'Pmenu', 'PmenuKind', 'PmenuExtra',
}
for _, group in ipairs(groups) do
  api.nvim_set_hl(0, group, { bg = 'none' })
end
require('lualine').setup({})

-- highlight search appearance with search count
require('hlslens').setup()
local kopts = { noremap = true, silent = true }
api.nvim_set_keymap('n', 'n',
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', 'N',
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- explorer, finder
require('mini.files').setup({})
keymap('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>')
require('fzf-lua').setup({
  winopts = {
    height = 0.94,
    width = 0.84,
    preview = {
      layout = 'vertical'
    }
  }
})
keymap('n', '<leader><space>', '<cmd>FzfLua builtin<cr>')
keymap('n', '<leader>fb', '<cmd>FzfLua buffers<cr>')
keymap('n', '<leader>ff', '<cmd>FzfLua files<cr>')
keymap('n', '<leader>fc', '<cmd>FzfLua files cwd=~/.config<cr>')
keymap('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>')

-- treesitter setup
require('nvim-treesitter').install({
  'html', 'css', 'javascript', 'typescript', 'tsx',
  'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
  'json', 'yaml', 'xml', 'properties', 'sql', 'bash',
  'java', 'swift'
})
api.nvim_create_autocmd('FileType', {
  group = api.nvim_create_augroup('TREESITTER_START_GROUP', { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- lsp, parsers, code completions,
require('mason').setup({})
-- mason: installs servers/tools. Servers are enabled explicitly below.
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
require('xcodebuild').setup({})

vim.lsp.enable({
  'ts_ls', 'eslint', 'html', 'cssls', 'emmet_language_server', -- react
  'jdtls', 'jsonls', 'yamlls',
  'sqlls', 'vimls', 'lua_ls', 'bashls',
  'pyright', 'sourcekit',
})
require('nvim-autopairs').setup({})
require('nvim-ts-autotag').setup({})
require('mini.completion').setup({})

-- lsp diagnostics
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
vim.api.nvim_set_keymap('n', '<leader>X', '', {
  noremap = true,
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      require('workspace-diagnostics').populate_workspace_diagnostics(client, 0)
    end
  end
})
keymap('n', '<leader>xx', "<cmd>FzfLua diagnostics_workspace<cr>")

---------------
-- autocmds
---------------
-- highlight yanked text
api.nvim_create_autocmd('TextYankPost', {
  group = api.nvim_create_augroup('HIGHLIGHT_YANK_GROUP', {}),
  pattern = '*',
  callback = function()
    vim.hl.on_yank({ timeout = 80 })
  end
})

-- before writing remove trailing spaces and format(if lsp supports it)
api.nvim_create_autocmd('BufWritePre', {
  group = api.nvim_create_augroup('PRE_WRITE_GROUP', {}),
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
api.nvim_create_autocmd('LspAttach', {
  pattern = '*',
  group = api.nvim_create_augroup('LSP_GROUP', {}),
  callback = function(e)
    local opts = { buffer = e.buf }
    keymap('n', 'gO', function() vim.lsp.buf.document_symbol() end, opts)
    keymap('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    keymap('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    keymap('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    keymap('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    keymap('n', 'gF', function() vim.lsp.buf.format() end, opts)
  end,
})
