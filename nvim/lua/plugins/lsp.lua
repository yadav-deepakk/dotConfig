return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {ui={border="rounded"}} },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = { exclude = { "jdtls" } },
        ensure_installed = { "vimls", "lua_ls", "ts_ls", "pyright", "jdtls", },
      })
    end
  },

}

