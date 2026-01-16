return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
  },
  keys = {
    { "<leader>kr", function() require("kulala").run() end, },
    { "<leader>ka", function() require("kulala").run_all() end, },
    { "<leader>ko", function() require("kulala").open() end, },
  },
}


