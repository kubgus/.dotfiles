-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Telescope (fuzzy-finder)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color theme
    use("bluz71/vim-nightfly-colors")
    use("rebelot/kanagawa.nvim")
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "tiagovla/tokyodark.nvim", as = "tokyodark" }

    -- Treesitter (code highlighter)
    use { 'nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" } }

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

    -- Toggleable terminal
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup {
            open_mapping = [[C-\]]
        }
    end }

    -- Custom status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- AI Copilot
    use("Exafunction/codeium.vim")

    -- Whitespace detection
    use {
        'johnfrankmorgan/whitespace.nvim',
        config = function()
            require('whitespace-nvim').setup({
                highlight = 'SpellBad',
            })
        end
    }

    -- Navigator
    use({
        "ray-x/navigator.lua",
        requires = {
            { "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
            { "neovim/nvim-lspconfig" }
        }
    })

    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                ui = {
                    enable = false
                },
                workspaces = {
                    {
                        name = "system",
                        path = "~/documents/obsidian",
                    },
                },
            })
        end,
    })

    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use "nvim-tree/nvim-tree.lua"

    use "nvim-tree/nvim-web-devicons"

    use "airblade/vim-gitgutter"
end)
