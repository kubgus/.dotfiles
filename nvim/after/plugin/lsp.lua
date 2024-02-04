local lsp = require('lsp-zero')

lsp.preset("recommended")

-- lsp.ensure_installed({
--	"tsserver",
--	"eslint",
--	"sumneko_lua",
--	"clangd"
--})

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

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Automatic language server install
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "clangd" },
	handlers = {
		lsp.default_setup,
	}
})

lsp.setup()
