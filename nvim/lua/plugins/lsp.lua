return {

  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master', 
    lazy = false,
    build = ":TSUpdate", 
    opts = {
      ensure_installed = { 
        "c", "cpp", "lua", "vim", "vimdoc", 
        "query", "markdown", "markdown_inline",
        "typescript", "html", "css", "xml", 
        "java", "groovy", 
      },
      auto_install = true,
    }, 
  },

  { 
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }, 
      },
    },
  }, 

  { "neovim/nvim-lspconfig" },

  { "mfussenegger/nvim-dap" }, 

}

