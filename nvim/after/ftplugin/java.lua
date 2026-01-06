vim.keymap.set("n", "<leader>t0", "<cmd>tabnew | terminal ./gradlew clean build<cr>")
vim.keymap.set("n", "<leader>C", "<cmd>JdtCompile<cr>")
vim.keymap.set("n", "<leader>R", "<cmd>tabnew | terminal ./gradlew bootRun<cr>")

vim.keymap.set("n", "co", "<cmd>lua require('jdtls').organize_imports()<cr>")
vim.keymap.set("n", "crv", "<cmd>lua require('jdtls').extract_variable()<cr>")
vim.keymap.set("v", "crv", "<esc><Cmd>lua require('jdtls').extract_variable(true)<cr>")
vim.keymap.set("n", "crc", "<cmd>lua require('jdtls').extract_constant()<cr>")
vim.keymap.set("v", "crc", "<esc><Cmd>lua require('jdtls').extract_constant(true)<cr>")
vim.keymap.set("v", "crm", "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>")

-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
-- vim.keymap.set("n", "<leader>df", "<cmd>lua require('jdtls').test_class()<cr>")
-- vim.keymap.set("n", "<leader>dn", "<cmd>lua require('jdtls').test_nearest_method()<cr>")
