return {

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        overrides = { Normal = { bg = "NONE" }, }
      })
      vim.cmd [[ colorscheme gruvbox ]]
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { sign = false },
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    },
  },

}

-- FIX: only to test working of todo comment - fix.
-- TODO: only to test working of todo comment - todo.
-- HACK: only to test working of todo comment - hack.
-- WARN: only to test working of todo comment - warning.
-- PERF: only to test working of todo comment - performance.
-- NOTE: only to test working of todo comment - note.
-- TEST: only to test working of todo comment - test.

