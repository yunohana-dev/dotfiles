local keymap = vim.keymap.set

keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })

vim.cmd("noremap! <C-?> <C-h>")
