-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group=vim.api.nvim_create_augroup("HIGHLIGHT_YANK_GROUP", {}),
  pattern="*",
  callback=function()
    vim.hl.on_yank({timeout=40})
  end
})

-- remove trailing spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group=vim.api.nvim_create_augroup("DKY_GROUP", {}),
  pattern="*",
  callback = function()
    vim.cmd [[ %s/\s\+$//e ]]
  end
})

-- add lsp related keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group=vim.api.nvim_create_augroup("LSP_GROUP", {}),
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

