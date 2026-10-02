return {
  'Civitasv/cmake-tools.nvim',
  config = function()
    require('cmake-tools').setup {
      cmake_executor = {
        toggleterm = {
          direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
          close_on_exit = false, -- whether close the terminal when exit
          auto_scroll = true, -- whether auto scroll to the bottom
          singleton = true, -- single instance, autocloses the opened one, if present
        },
      },
    }
  end,
}
