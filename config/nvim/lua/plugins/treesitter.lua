return {
    "nvim-treesitter/nvim-treesitter",
    priority=500,
    config=function()
        require'nvim-treesitter.configs'.setup {
            highlight={
                enable=true,
                additional_vim_regex_highlighting=false,
            },
            indent = {
                enable = true
            }

        }
    end,
}
