local builtin = require('telescope.builtin')
-- (project-locate)
vim.keymap.set('n', '<leader>pl', builtin.find_files, {})
-- 
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- (project-grep)
vim.keymap.set('n', '<leader>pg', function()
	builtin.grep_string({ search=vim.fn.input("Grep > ") })
end)
