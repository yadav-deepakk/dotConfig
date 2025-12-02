return {

  {--colorscheme vague
    "vague2k/vague.nvim",
    lazy=false,
    priority=1000,
    config = function()
      require "vague".setup({ transparent = true })
      vim.cmd[[ colorscheme vague ]]
    end
  }, 
  
  {--colorscheme neo-solarized
    "Tsuzat/NeoSolarized.nvim",
    -- lazy = false, 
    -- priority = 1000, 
    -- config = function()
    --   vim.cmd [[ colorscheme NeoSolarized ]]
    -- end
  },

  {-- lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        -- lualine_c = { { "filename", path=1 } },
        lualine_c = {"filename"},
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

