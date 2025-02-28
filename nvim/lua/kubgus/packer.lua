-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
    }

    -- Themes
    use {
        "bluz71/vim-nightfly-colors",
    }
    use {
        "rebelot/kanagawa.nvim",
    }
    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }
    use {
        "tiagovla/tokyodark.nvim",
        as = "tokyodark",
    }

    -- Telescope (fuzzy-finder)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        },
    }

    -- Treesitter (code highlighter)
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ":TSUpdate" },
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }

    -- Undo tree
    use {
        "mbbill/undotree",
    }

    -- Git functions
    use {
        "tpope/vim-fugitive"
    }

    -- LSP (autocomplete)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
    }

    -- Custom status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- AI Copilot
    use {
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
    }

    -- Whitespace detection
    use {
        'johnfrankmorgan/whitespace.nvim',
    }

    -- Navigator
    use {
        "ray-x/navigator.lua",
        requires = {
            { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
            { "neovim/nvim-lspconfig" }
        },
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = {
            { "nvim-lua/plenary.nvim" }
        },
    }

    use {
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    use {
        "folke/trouble.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        }
    }

    use {
        "nvim-tree/nvim-tree.lua"
    }

    use {
        "nvim-tree/nvim-web-devicons"
    }

    use {
        "airblade/vim-gitgutter"
    }

    use {
        "chrisbra/Colorizer"
    }

end)
