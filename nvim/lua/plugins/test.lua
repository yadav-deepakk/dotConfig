return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
  },
  config = function(_, opts)
    require("kulala").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "http", "rest" },
      callback = function(ev)
        local map_opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "<CR>", function() require("kulala").run() end, map_opts)
        vim.keymap.set("n", "<leader>ka", function() require("kulala").run_all() end, map_opts)
        vim.keymap.set("n", "<leader>ko", function() require("kulala").open() end, map_opts)
      end,
    })
  end
}
