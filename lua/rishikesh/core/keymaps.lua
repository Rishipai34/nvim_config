vim.g.mapleader = " "


local keymap = vim.keymap

--genral keymap 

--keymap.set("i", "jk", "<ESC>")


-- search highlights 
keymap.set("n", "<leader>nh", ":nohl<CR>")


--delete without copying into a register
keymap.set("n", "x", "_x") 


-- increment and decrement numbers 
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- set navigation on tabs 
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")
-- open file explorer
keymap.set("n", "<leader>tr", ":NvimTreeToggle<CR>")

-- telecope keymaps 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

