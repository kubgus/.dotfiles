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

-- Forbidden remaps
vim.keymap.set("n", "<C-c>", "V")
vim.keymap.set("v", "<C-c>", "<C-c>a")
vim.keymap.set("i", "<C-c>", "<C-c>")

-- Tabs
vim.keymap.set("n", "<leader>j", ":tabnext<CR>")
vim.keymap.set("n", "<leader>k", ":tabnext -<CR>")
vim.keymap.set("n", "<leader>h", ":tabnext -<CR>")
vim.keymap.set("n", "<leader>l", ":tabnext +<CR>")
vim.keymap.set("n", "<leader>n", ":tabnew<CR>")
vim.keymap.set("n", "<leader>e", ":tabclose<CR>")

-- Terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set("t", "<C-e>", "<C-\\><C-n>:q<CR>")

-- Search and replace
vim.keymap.set("n", "<leader>sara", ":%s/") -- All
vim.keymap.set("n", "<leader>sarr", ":+s/") -- Default
vim.keymap.set("n", "<leader>sarn", ":s/") -- Normal

-- C++ (almost illegal)
vim.keymap.set("n", "<leader>cppm", "iint main() {<Enter>}<Esc>O") -- Main
vim.keymap.set("n", "<leader>cppn", "i#include <iostream><Enter><Enter>int main() {<Enter>}<Esc>O") -- New

-- README ease of use
vim.keymap.set("n", "<leader>mdkb", "i<Enter><kbd></kbd><Esc>5hi")

-- Copilot
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")

-- LSP Restart
vim.keymap.set("n", "<leader>lsp", ":LspRestart<CR>")
