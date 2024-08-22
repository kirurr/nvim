-- Buffers
vim.keymap.set("n", "[b", ":bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "]b", ":bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })

vim.keymap.set("n", "<C-b>d", ":bd<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<C-b>p", ":bp<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<C-b>n", ":bn<CR>", { noremap = true, silent = true, desc = "Next buffer" })
