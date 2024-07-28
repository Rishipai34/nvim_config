return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function () 
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    --custom config, 
    --currently using default setiings 
    --refer to configuration below 
  },
}

