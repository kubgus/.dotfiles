-- Change leader to space
vim.g.mapleader = " "

------------------------------------------------------
-- NeoVim Shortcuts
------------------------------------------------------

-- Netrw easy access (project-overview)
vim.keymap.set("n", "<leader>po", vim.cmd.Ex)

-- greatest remap ever
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- Visual move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line below to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumps keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search terms stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Awesomedel
vim.keymap.set("n", "<leader>d", "\"_d")

-- Tabs
vim.keymap.set("n", "<leader>j", ":tabnext<CR>")
vim.keymap.set("n", "<leader>k", ":tabnext -<CR>")
vim.keymap.set("n", "<leader>h", ":tabnext -<CR>")
vim.keymap.set("n", "<leader>l", ":tabnext +<CR>")
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<leader>e", ":tabclose<CR>")

-- Search and replace
vim.keymap.set("n", "<leader>sara", ":%s/") -- All
vim.keymap.set("n", "<leader>sarr", ":+s/") -- Default
vim.keymap.set("n", "<leader>sarn", ":s/") -- Normal

-- C++ (almost illegal)
vim.keymap.set("n", "<leader>cppm", "iint main() {<Enter>}<Esc>O") -- Main
vim.keymap.set("n", "<leader>cppn", "i#include <iostream><Enter><Enter>int main() {<Enter>}<Esc>O") -- New
vim.keymap.set("n", "<leader>cpph", "i#pragma once<Enter><Enter>") -- Header file

-- README ease of use
vim.keymap.set("n", "<leader>mdkb", "i<Enter><kbd></kbd><Esc>5hi")

------------------------------------------------------
-- Plugins
------------------------------------------------------

-- Codeium
vim.keymap.set("n", "<leader>ce", ":Codeium Enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Codeium Disable<CR>")

-- Fugitive
vim.keymap.set("n", "<leader>gh", vim.cmd.Git)

--LSP
do
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

    vim.keymap.set("n", "<leader>lsp", ":LspRestart<CR>")
end

-- Telescope
do
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pl', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pg', function()
        builtin.grep_string({ search=vim.fn.input("Grep > ") })
    end)
end

-- Toggleterm
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>:q<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Undotree
vim.keymap.set("n",  "<leader>u",  vim.cmd.UndotreeToggle)
