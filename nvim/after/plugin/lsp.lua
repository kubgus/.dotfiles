local lsp = require('lsp-zero')

lsp.preset("recommended")

local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
	mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select=false,
        }),
        ["<C-h>"] = cmp.mapping.scroll_docs(2),
        ["<C-u>"] = cmp.mapping.scroll_docs(-2),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function ()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, {'s', 'i'}),
        ["<S-Tab>"] = cmp.mapping(function ()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, {'s', 'i'})
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "codeium" },
        { name = "luasnip" },
    },
})

-- Automatic language server install
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "clangd" },
	handlers = {
		lsp.default_setup,
	}
})

lsp.setup()
