-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

local colors = {
  bg       = '#001324',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  grey     = '#cccccc',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- auto change color according to neovims mode
local mode_color = {
    n = colors.grey,
    i = colors.green,
    v = colors.blue,
    [''] = colors.blue,
    V = colors.blue,
    c = colors.magenta,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.red,
    t = colors.red,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = function()
      return { bg = mode_color[vim.fn.mode()], fg = colors.bg, gui = 'bold'}
    end,
}

ins_left {
    function()
        return ''
    end,
    color = function()
        return { bg = colors.bg, fg = mode_color[vim.fn.mode()], gui = 'bold' }
    end,
    cond = conditions.hide_in_width,
    padding = { left = 0, right = 0 },
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'none'
        local buf_ft = vim.api.nvim_buf_get_var(0, 'filetype')
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' ',
    color = { fg = '#ffffff', gui = 'bold' },
}

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic', 'coc' },

    -- Displays diagnostics for the defined severity types
    sections = { 'error', 'warn', 'info', 'hint' },

    diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
    },
    symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
    colored = true,           -- Displays diagnostics status in color if set to true.
    update_in_insert = false, -- Update diagnostics in insert mode.
    always_visible = false,   -- Show diagnostics even if there are none
}

ins_left {
    'diff',
    colored = true,
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.blue },
        removed = { fg = colors.red },
    },
    symbols = { added = '+', modified = '~', removed = '-' },
    padding = 1,
    cond = conditions.hide_in_width,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'none'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' ',
    color = { fg = '#ffffff' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.fg, gui = 'bold' },
}

-- Add components to right sections
-- ins_right {
--   'o:encoding', -- option component same as &encoding in viml
--  fmt = string.upper, -- I'm not sure why it's upper case either ;)
--  cond = conditions.hide_in_width,
--  color = { fg = colors.green, gui = 'bold' },
--}

-- ins_right {
--  'fileformat',
--  fmt = string.upper,
--  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
--  color = { fg = colors.green, gui = 'bold' },
--}


ins_right {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_right { 'progress', color = { gui = 'bold' } }

ins_right {
    function()
        return ''
    end,
    color = function()
        return { bg = colors.bg, fg = mode_color[vim.fn.mode()], gui = 'bold' }
    end,
    cond = conditions.hide_in_width,
    padding = { left = 0, right = 0 },
}

ins_right { 'location', color = function ()
    return {
        bg = mode_color[vim.fn.mode()],
        fg = colors.bg,
        gui = 'bold'
    }
end,
}

-- Now don't forget to initialize lualine
lualine.setup(config)
