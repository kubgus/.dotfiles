local lsp = require('lsp-zero')

lsp.preset("recommended")

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.confirm({ select=true }),
        ["<C-h>"] = cmp.mapping.scroll_docs(2),
        ["<C-u>"] = cmp.mapping.scroll_docs(-2),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "codeium" },
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
