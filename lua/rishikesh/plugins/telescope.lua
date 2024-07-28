return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}






--return {
--  "nvim-telescope/telescope.nvim",
--  branch = "0.1.x",
--  dependencies = {
--  "nvim-lua/plenary.nvim",
--  { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
--  "nvim-tree/nvim-web-devicons",
--  },
--  config = function()
--    local teslecope = reqruie("telescope")
--    local actions = require("telescope.actions")
--
--    telescope.setup({
--    defaults = {
--      path_display = {"smart"},
--      mappings = {
--        i = {
--          ["<C-k>"] = actions.move_selection_previous, --move to prev result
--          ["<C-j>"] = actions.move_selsctions_next,-- move to the next result 
--          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--          },
--        },
--      },
--    })
--    telescope.load_extention("fzf")
--    local keymap = vim.keymap -- load keymap 
--
--    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") --find filesss
--    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") --find filesss
--    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>" ) --find filesss
--    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>" ) --find filesss
--  end,
--  
--}
--older version of the setup
--local telescope_setup, telescope = pcall(requrie "telescope")
--if not telescope_setup then 
--  return
--end 
--
--local actions_setup, telescope = pcall(requrie, "telescope.actions")
--if not actions_setup then 
--  return
--end 
--
--telescope.setup({
--  --configure custom mappings
--   defaults = {
--   mappings = {
--      i = {
--        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--        ["<C-j>"] = actions.move_selection_next, -- move to next result
--        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
--      },
--    },
--  },
--})
--
--telescope.load_extention("fzf")

