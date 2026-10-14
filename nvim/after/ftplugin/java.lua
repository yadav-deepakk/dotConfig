vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- jdtls related mappings
vim.cmd [[
  nnoremap cO <Cmd>lua require'jdtls'.organize_imports()<CR>
  nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
  vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
  nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
  vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
  vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
]]

require("fzf-lua").setup({
  winopts = {
    height = 0.96,
    width = 0.94,
    preview = {
      layout = "horizontal"
    }
  }
})
-- If using nvim-dap
-- This requires java-debug and vscode-java-test bundles
-- vim.cmd [[
--   nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
--   nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>
-- ]]
