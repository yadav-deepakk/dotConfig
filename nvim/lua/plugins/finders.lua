return {

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy=false,
    keys = {
      { "<leader>ff",       "<cmd>FzfLua files<cr>" },
      { "<leader>fc",       "<cmd>FzfLua files cwd=~/.config<cr>" },
      { "<leader>fb",       "<cmd>FzfLua buffers<cr>" },
      { "<leader>fg",       "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fh",       "<cmd>FzfLua helptags<cr>" },
      { "<leader><space>",  "<cmd>FzfLua builtin<cr>" },
    },
    opts = {
      winopts = {
        width = 0.92,
        height = 0.92,
      },
    }
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>T",  "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
      { "<S-Tab>",    "<cmd>lua require('harpoon.ui').nav_prev()<cr>" },
      { "<Tab>",      "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
    },
    opts = { menu = { width=90 }},
  },

}

