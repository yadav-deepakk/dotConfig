return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>r]", desc = "Send request" },
    { "<leader>rr", desc = "Send all requests" },
    { "<leader>ro", desc = "Open scratchpad" },
  },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = "<leader>r",
    kulala_keymaps_prefix = "",
  },
}
