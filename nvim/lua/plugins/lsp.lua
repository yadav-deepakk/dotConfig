return {

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {ui={border="rounded"}} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = { exclude={"jdtls"} },
      ensure_installed = {
        "vimls",
        "lua_ls",
        "ts_ls",
        "pyright",
        "jdtls",
      },
    },
  },

}

