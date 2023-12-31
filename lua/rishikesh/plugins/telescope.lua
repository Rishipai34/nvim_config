local telescope_setup, telescope = pcall(requrie, "telescope")
if not telescope_setup then 
  return
end 

local actions_setup, telescope = pcall(requrie, "telescope.actions")
if not actions_setup then 
  return
end 

telescope.setup({
  --configure custom mappings
   defaults = {
   mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

telescope.load_extention("fzf")

