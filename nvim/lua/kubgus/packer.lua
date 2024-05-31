-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Telescope (fuzzy-finder)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color theme
    use("bluz71/vim-nightfly-colors")
    use("rebelot/kanagawa.nvim")

    -- Treesitter (code highlighter)
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }

    -- Undo tree
    use("mbbill/undotree")

    -- Git functions
    use("tpope/vim-fugitive")

    -- LSP (autocomplete)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- LSP Language server deps
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            open_mapping = [[C-\]]
        }
    end }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- AI Copilot
    use {
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    }

    -- Error handling
    use("folke/trouble.nvim")

    -- Whitespace
    use {
        'johnfrankmorgan/whitespace.nvim',
        config = function()
            require('whitespace-nvim').setup({
                -- configuration options and their defaults

                -- `highlight` configures which highlight is used to display
                -- trailing whitespace
                highlight = 'DiffDelete',

                -- `ignored_filetypes` configures which filetypes to ignore when
                -- displaying trailing whitespace
                ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },

                -- `ignore_terminal` configures whether to ignore terminal buffers
                ignore_terminal = true,

                -- `return_cursor` configures if cursor should return to previous
                -- position after trimming whitespace
                return_cursor = true,
            })
        end
    }

    use({
        "ray-x/navigator.lua",
        requires = {
            { "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
            { "neovim/nvim-lspconfig" }
        }
    })
end)
