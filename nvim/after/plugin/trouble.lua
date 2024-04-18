require("trouble").setup{
    icons = false
}

vim.keymap.set("n",  "<leader>x",  vim.cmd.TroubleToggle)
