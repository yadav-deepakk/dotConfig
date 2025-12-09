return {

  { "sphamba/smear-cursor.nvim", opts = {} },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },


  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        float = { transparent = true, },
      })
      vim.cmd.colorscheme("catppuccin")
    end
  } ,

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local kanagawa = require("kanagawa")
  --     kanagawa.setup({ transparent=true, })
  --     kanagawa.load("dragon")
  --   end,
  -- },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      tabline = { },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {{"filename", path=1 }},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
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

