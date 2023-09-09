vim.keymap.set("n","<leader>pv",vim.cmd.Ex)
vim.keymap.set("n","<C-k>",":bnext<CR>")
vim.keymap.set("n","<C-j>",":bprevious<CR>")
vim.keymap.set("n","<C-q>",":bdelete<CR>")
vim.keymap.set("n","<C-l>",":buffers<CR>")
vim.api.nvim_set_keymap('n', '<Space>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<Space>y', '"+y', { noremap = true })

