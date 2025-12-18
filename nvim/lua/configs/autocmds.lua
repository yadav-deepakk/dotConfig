local yank_group=vim.api.nvim_create_augroup("HIGHLIGHT_YANK_GROUP", {})
local dky_group=vim.api.nvim_create_augroup("DKY_GROUP", {})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group=yank_group,
  pattern="*",
  callback=function()
    vim.hl.on_yank({ hl="InSearch", timeout=150 })
  end
})

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group=dky_group,
  pattern="*",
  callback = function()
    vim.cmd [[ %s/\s\+$//e ]]
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group=dky_group,
  callback=function(e)
    local opts={ buffer=e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border="rounded"}) end, opts)
    vim.keymap.set("n", "gws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "gra", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "grr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "grd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("i", "<c-s>", function() vim.lsp.buf.signature_help() end, opts)
  end
})

-- load colortheme and lualine
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group=dky_group,
--   pattern="*",
--   callback=function()
--     local ft = vim.bo.filetype
--     if ft == "java" then
--       pcall(vim.cmd.colorscheme, "kanagawa")
--     else
--       pcall(vim.cmd.colorscheme, "catppuccin")
--     end
--     require("lualine").setup({})
--   end
-- })

