return {

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
        width = 0.82,
        height = 0.92,
        preview = {
          layout = "vertical"
        }
      },
    }
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<", "<cmd>lua require('harpoon.ui').nav_prev()<cr>" },
      { ">", "<cmd>lua require('harpoon.ui').nav_next()<cr>" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>" },
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>" },
      { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>" },
    },
    opts = { menu = { width = 90 } },
  },

}

