require("navigator").setup({
    mason = true,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    lsp = {
        format_on_save = false,
        enable = true,
        code_action = {
            enable = false,
        },
        code_lens_action = {
            enable = false,
        }
    },
    icons = {
        icons = true,
        code_action_icon = '󱐋',
        code_lens_action_icon = '',

        -- Diagnostics (gutter)
        diagnostic_head = '',
        diagnostic_err = '',
        diagnostic_warn = '',
        diagnostic_info = '',
        diagnostic_hint = '',

        -- Diagnostics (floating window)
        diagnostic_head_severity_1 = '󰚑',
        diagnostic_head_severity_2 = '󰰲',
        diagnostic_head_severity_3 = '󰂚',
        diagnostic_head_description = '', -- suffix for severities
        diagnostic_virtual_text = '', -- floating text preview (set to empty to disable)
        diagnostic_file = '', -- icon in floating window, indicates the file contains diagnostics

        -- Values (floating window)
        value_definition = '󰐕', -- identifier defined
        value_changed = '󰑖', -- identifier modified
        context_separator = ' 󰁔 ', -- separator between text and value

        -- Formatting for Side Panel
        side_panel = {
            section_separator = '󰇜',
            line_num_left = '',
            line_num_right = '',
            inner_node = '├○',
            outer_node = '╰○',
            bracket_left = '⟪',
            bracket_right = '⟫',
        },
        fold = {
            prefix = '⚡',
            separator = '',
        },

        -- Treesitter
        match_kinds = {
            var = ' ',
            const = '󱀍 ',
            method = 'ƒ ',
            ['function'] = '󰡱 ', -- function -- "🤣", -- Fun
            parameter = '󰀫  ', -- param/arg -- Pi
            parameters = '󰀫  ', -- param/arg -- Pi
            required_parameter = '󰀫  ', -- param/arg -- Pi
            associated = '󰌷', -- linked/related
            namespace = 'N', -- namespace
            type = '󰉿', -- type definition
            field = '󰠴', -- field definition
            module = '󰕳', -- module
            flag = '󰈻', -- flag
        },
        treesitter_defult = '󰔱', -- default symbol when unknown node.type or kind
        doc_symbols = '󰈙', -- document
    },
})
