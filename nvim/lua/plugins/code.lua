return {

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

