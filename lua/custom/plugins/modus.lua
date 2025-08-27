return {
  'miikanissi/modus-themes.nvim',
  config = function()
    require('modus-themes').setup {
      style = 'modus_vivendi', -- Always use modus_operandi regardless of `vim.o.background`
      variant = 'default', -- Use deuteranopia variant

      on_colors = function(colors)
        colors.fg_lualine = colors.fg_main
        colors.bg_lualine = colors.bg_active
        colors.fg_lualine_inactive = colors.fg_inactive
        colors.bg_lualine_inactive = colors.bg_inactive
      end,
      on_highlights = function(highlight, color)
        highlight.CursorLineNr = { fg = color.fg_active, bg = color.bg_main }
        highlight.NeoTreeNormal = { fg = color.fg_active, bg = color.bg_main }
        highlight.NeoTreeNormalNC = { fg = color.fg_inactive, bg = color.bg_main }
        highlight.LuaLineNormal = { fg = color.fg_lualine, bg = color.bg_lualine }
        highlight.LuaLineInactive = { fg = color.fg_lualine_inactive, bg = color.bg_lualine_inactive }
        highlight.LuaLineFileName = { fg = color.fg_lualine, bg = color.bg_lualine }
        highlight.LuaLineCursorPosition = { fg = color.fg_lualine, bg = color.bg_lualine }
      end,
    }
  end,
}
