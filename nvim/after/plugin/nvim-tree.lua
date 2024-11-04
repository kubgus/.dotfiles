-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 48,
        float = {
            enable = true,
            open_win_config = {
                row = 0,
                col = 999,
                width = 48,
                height = 38,
            },
        },
    },
    update_focused_file = {
        enable = true,
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        group_empty = true,
        icons = {
            git_placement = "after",
            glyphs = {
                folder = {
                    arrow_closed = " ",
                    arrow_open = " ",
                },
            },
        },
    },
})
