return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local function dec_to_hex(nValue) -- http://www.indigorose.com/forums/threads/10192-Convert-Hexadecimal-to-Decimal
      if type(nValue) == 'string' then
        nValue = tonumber(nValue)
      end
      local nHexVal = string.format('%X', nValue) -- %X returns uppercase hex, %x gives lowercase letters
      local sHexVal = nHexVal .. ''
      if nValue < 16 then
        return '0' .. tostring(sHexVal)
      else
        return sHexVal
      end
    end

    local function color_at_percent_gradient(colors, percentage)
      local rgbs = { {}, {}, {} }
      for i = 1, #colors, 1 do
        local r, g, b = string.match(colors[i], '#([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])')
        rgbs[1][i] = r
        rgbs[2][i] = g
        rgbs[3][i] = b
      end

      local rgbfs = { 0, 0, 0 }
      local section = math.min(math.floor(percentage * (#colors - 1)) + 1, #colors - 1)
      for i = 1, 3 do
        for j = section, section + 1 do
          rgbfs[i] = rgbfs[i] + tonumber(rgbs[i][j], 16) * (1 - (j - section) + (j ~= section + 1 and -1 or 1) * ((percentage * (#colors - 1)) - section + 1))
        end
      end

      return '#' .. dec_to_hex(rgbfs[1]) .. dec_to_hex(rgbfs[2]) .. dec_to_hex(rgbfs[3])
    end

    -- Colors
    LogoColors = { '#ABABAB', '#141414' }
    DirectoryColor = '#FFFFFF'

    vim.api.nvim_set_hl(0, 'AlphaLogo1', { fg = color_at_percent_gradient(LogoColors, 0.000) })
    vim.api.nvim_set_hl(0, 'AlphaLogo2', { fg = color_at_percent_gradient(LogoColors, 0.077) })
    vim.api.nvim_set_hl(0, 'AlphaLogo3', { fg = color_at_percent_gradient(LogoColors, 0.154) })
    vim.api.nvim_set_hl(0, 'AlphaLogo4', { fg = color_at_percent_gradient(LogoColors, 0.231) })
    vim.api.nvim_set_hl(0, 'AlphaLogo5', { fg = color_at_percent_gradient(LogoColors, 0.308) })
    vim.api.nvim_set_hl(0, 'AlphaLogo6', { fg = color_at_percent_gradient(LogoColors, 0.385) })
    vim.api.nvim_set_hl(0, 'AlphaLogo7', { fg = color_at_percent_gradient(LogoColors, 0.462) })
    vim.api.nvim_set_hl(0, 'AlphaLogo8', { fg = color_at_percent_gradient(LogoColors, 0.538) })
    vim.api.nvim_set_hl(0, 'AlphaLogo9', { fg = color_at_percent_gradient(LogoColors, 0.615) })
    vim.api.nvim_set_hl(0, 'AlphaLogo10', { fg = color_at_percent_gradient(LogoColors, 0.692) })
    vim.api.nvim_set_hl(0, 'AlphaLogo11', { fg = color_at_percent_gradient(LogoColors, 0.769) })
    vim.api.nvim_set_hl(0, 'AlphaLogo12', { fg = color_at_percent_gradient(LogoColors, 0.846) })
    vim.api.nvim_set_hl(0, 'AlphaLogo13', { fg = color_at_percent_gradient(LogoColors, 0.923) })
    vim.api.nvim_set_hl(0, 'AlphaLogo14', { fg = color_at_percent_gradient(LogoColors, 1.000) })

    vim.api.nvim_set_hl(0, 'AlphaDirectory', { fg = DirectoryColor, bold = true })

    dashboard.section.header.type = 'group'
    dashboard.section.header.val = {
      {
        type = 'text',
        val = [[  ⢀⠀⠀⠀⠀⣀⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀]],
        opts = { hl = 'AlphaLogo1', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⢀⡾⢀⣠⣶⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣠⣤⣤⣶⠞⠁⠀]],
        opts = { hl = 'AlphaLogo2', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⢠⣿⣧⣾⡿⠋⣀⣠⣤⠞⠁⠀⠀⠀⢀⣤⣶⣾⣿⣿⣿⣿⣟⣛⡛⠋⠁⠀⣀⡠]],
        opts = { hl = 'AlphaLogo3', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⣾⣿⣿⣿⣷⣿⡿⠟⠁⠀⠀⠀⠀⡀⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⠿⠛⠉⠀]],
        opts = { hl = 'AlphaLogo4', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠁⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣀⡀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo5', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠘⠿⣿⣿⣿⣿⣿⣿⣿⣟⠒⠂⢀⣾⣿⣿⣿⣿⣿⣷⠙⠻⠟⠒⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo6', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣵⣾⣿⣿⣿⣿⣿⣿⣿⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo7', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo8', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo9', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠀⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣤⡴⢖⣁⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo10', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⢸⠟⠁⠀⠀⠹⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠋⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo11', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠈⠀⠀⠀⠠⡞⡗⡏⢸⡧⠈⠻⣿⢿⡻⢯⡛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo12', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣠⡟⠀⠀⠀⠀⠁⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo13', shrink_margin = false, position = 'center' },
      },
      {
        type = 'text',
        val = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠏⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        opts = { hl = 'AlphaLogo14', shrink_margin = false, position = 'center' },
      },
    }

    local sub_header = { type = 'text', val = vim.fn.fnamemodify(vim.fn.getcwd(), ':t'), opts = { hl = 'AlphaDirectory', position = 'center' } }

    local opts = {
      layout = {
        { type = 'padding', val = 1 },
        dashboard.section.header,
        { type = 'padding', val = 2 },
        --sub_header,
        { type = 'padding', val = 1 },
        dashboard.section.buttons,
        { type = 'padding', val = 3 },
        dashboard.section.footer,
      },
      opts = {
        margin = 5,
      },
    }

    alpha.setup(opts)
  end,
  silent = true,
}
