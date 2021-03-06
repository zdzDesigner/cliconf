-- Setup nvim-cmp.
local cmp = require('cmp')
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
    snippet = {
        -- https://github.com/hrsh7th/nvim-cmp/issues/351
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- 重复问题
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.complete(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<CR>'] = cmp.mapping(function(fallback)
        --     -- cmp.mapping.confirm({ select = true })
        --     if has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        --     end
        --
        -- end, {"i", "s"}),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"]() == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        -- For vsnip user.
        { name = 'vsnip' },

        -- For luasnip user.
        { name = 'luasnip' },

        -- For ultisnips user.
        { name = 'ultisnips' },

        { name = 'buffer' },
    }
})

-- Setup lspconfig.
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
    --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- }


