local lsp = require('lsp-zero')

lsp.preset("recommended")

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-l>"] = cmp.mapping.confirm({ select=true }),
        ["<C-h>"] = cmp.mapping.confirm({ select=true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })
})

-- Automatic language server install
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "clangd" },
	handlers = {
		lsp.default_setup,
	}
})

lsp.setup()
