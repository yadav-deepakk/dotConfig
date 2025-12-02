return {

  {-- file explore
    "stevearc/oil.nvim",
    keys = {
      { "<leader>E", "<cmd>Oil<cr>" }
    },
    opts = {
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = true,
      },
      columns = {
        "permissions",
        "icon",
      },
      float = {
        max_width = 0.7,
        max_height = 0.6,
        border = "rounded",
      },
    },
  },

  {-- fuzzy finder
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>" },
      -- { "<leader>fo", "<cmd>FzfLua oldfiles<cr>" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fh", "<cmd>FzfLua helptags<cr>" },
      { "<leader>fc", "<cmd>FzfLua files cwd=~/.config<cr>" },
      { "<leader><space>", "<cmd>FzfLua builtin<cr>" },
    },
    opts = {
      winopts = { -- UI Options
        width = 0.92,
        height = 0.92,
        fullscreen = false,
      }, 
    }, 
  }, 


  {-- harpoon
    "ThePrimeagen/harpoon",
    dependency = { "nvim-lua/plenary.nvim" }, 
    keys = {
      { "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" }, 
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>" }, 
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" }, 
      { "<Tab>", "<cmd>lua require('harpoon.ui').nav_next()<cr>" }, 
      { "<S-Tab>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" }, 
      { "<leader>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>" }, 
    },
  }, 

}

