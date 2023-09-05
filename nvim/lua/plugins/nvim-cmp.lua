return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"

    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        --require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping(function (fallback)
                    if luasnip.expandable() then
                        luasnip.expand()
                    elseif cmp.visible() then
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        })
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<S-Tab>'] = cmp.mapping(function (fallback)
                    if cmp.visible() then
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'})
            },
            sources = {
                { name = "nvim_lsp"},
                { name = "buffer" },
                { name = "luasnip"},
            },
        })
    end,
}

