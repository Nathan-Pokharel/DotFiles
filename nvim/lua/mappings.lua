vim.keymap.set("n","<leader>pv",vim.cmd.Ex)
vim.keymap.set("n", "<leader>zz", function() vim.lsp.buf.format() end, {})
vim.api.nvim_set_keymap('n', '<Space>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<Space>y', '"+y', { noremap = true })

