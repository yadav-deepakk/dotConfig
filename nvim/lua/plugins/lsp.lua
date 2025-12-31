return {

  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = { ui = { border = "rounded" } } },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "nvim-mini/mini.completion"
    },
    config = function()
      require("mini.completion").setup({})
      local servers = { "vimls", "lua_ls", "ts_ls", "pyright", "jdtls", }
      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })
      vim.lsp.enable({
        servers = servers,
        on_attach = function(client, bufnr)
          require("mini.completion").on_attach(client, bufnr)
        end
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "markdown", "markdown_inline", "gitignore",
        "vim", "vimdoc", "lua", "c", "cpp",
        "html", "htmx", "css", "xml", "json",
        "javascript", "typescript", "tsx", "jsx",
        "java", "go", "rust",
      },
    },
  },

}
