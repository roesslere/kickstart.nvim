return {
  'mistricky/codesnap.nvim',
  build = 'make',
  config = function()
    require('codesnap').setup {
      bg_color = '#535c68',
      bg_padding = 0,
      code_font_family = 'GeistMono Nerd Font',
    }
  end,
}
