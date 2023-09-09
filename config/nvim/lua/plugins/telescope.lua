return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local telescope = require("telescope")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fc', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>Fc', builtin.current_buffer_fuzzy_find, {})
        local options = {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0, -- Set the preview width to 0 to disable the preview
                        results_width = 0.4,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.70,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_ignore_patterns = { "node_modules" },
                path_display = { "truncate" },
                winblend = 2,
                border = {},
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            },

        }

        telescope.setup(options)
    end,
}
