vim.g.mapleader = " "

local bind = vim.keymap.set

bind("i", "jk", "<ESC>") -- jk keys are the same as esc (exits insert mode)
bind("n", "x", '"_x"') -- in normal mode when deleting a single char with x it does not copy it to the register
bind("n", "<leader>nh", ":nohl<CR>") -- in normal mode nh clears search highlights

-- NeoTree
bind("n", "<leader>e", "<cmd>Neotree toggle<CR>")

-- Move to window using the <ctrl> hjkl keys
bind("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
bind("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
bind("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
bind("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Move to Buffer using <ctrl> hl keys
bind("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
bind("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- better indenting
bind("v", "<", "<gv")
bind("v", ">", ">gv")
