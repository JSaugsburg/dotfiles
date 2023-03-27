vim.opt.termguicolors = true
local vi_utils = require('feline.providers.vi_mode')

local components = {
  active = {},
  inactive = {}
}

-- GRUVBOX-MATERIAL
--local colors = {
--  --bg = '#282828',
--  bg = '#3c3836',
--  fg = '#a89984',
--  black = '#1d2021',
--  grey = '#7c6f64',
--  grey2 = '#665c54',
--  yellow = '#d8a657',
--  cyan = '#89b482',
--  oceanblue = '#45707a',
--  green = '#a9b665',
--  orange = '#e78a4e',
--  violet = '#d3869b',
--  magenta = '#c14a4a',
--  white = '#ebdbb2',
--  skyblue = '#7daea3',
--  red = '#ea6962',
--}

-- ONEDARK
local colors = {
  fg        = '#abb2bf',
  bg        = '#282c34',
  black     = '#1e2127',
  white     = '#abb2bf',
  grey      = '#5c6370',
  grey2     = '#3b3f4c',
  red       = '#e06c75',
  magenta   = '#be5046',
  green     = '#98c379',
  yellow    = '#e5c07b',
  orange    = '#d19a66',
  blue      = '#61afef',
  cyan      = '#56b6c2',
  oceanblue = '#3b84c0',
  skyblue   = '#3c909b',
  violet    = '#c678dd',
}
-- active
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
-- inactive
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- VI MODE
table.insert(components.active[1], {
  provider = 'vi_mode',
  hl = function()
    return {
      name = vi_utils.get_mode_highlight_name(),
      bg = vi_utils.get_mode_color(),
      style = 'bold',
      fg = 'black'
    }
    end,
    right_sep = {
      str = '  ',
      hl = function()
        return {
          fg = vi_utils.get_mode_color(),
          bg = 'black'
        }
      end
      },
      show_mode_name = true,
      -- Uncomment the next line to disable icons for this component and use the mode name instead
      icon = ''
})
-- FILE INFO
table.insert(components.active[1], {
  provider = {
    name = 'file_info',
    opts = {
      file_modified_icon = '',
      --type = 'unique-short'
      type = 'short-path'
    }
  },
  hl = {
    fg = 'cyan',
    bg = 'black'
  },
  right_sep = {
    str = '  ',
    hl = {
      fg = 'black'
    }
  }
})
-- GIT
table.insert(components.active[1], {
  provider = 'git_branch',
  hl = {
    fg = 'violet'
  },
  icon = ' '
})

table.insert(components.active[1], {
  provider = 'git_diff_added',
  hl = {
    fg = 'green'
  }
})

table.insert(components.active[1], {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red'
  }
})

table.insert(components.active[1], {
  provider = 'git_diff_changed',
  hl = {
    fg = 'yellow'
  },
})

table.insert(components.active[2], {
  provider = 'lsp_client_names'
})

-- Right
table.insert(components.active[3], {
  provider = 'diagnostic_errors',
  icon = '',
  hl = {
    fg = 'black',
    bg = 'red'
  },
  left_sep = {
    str = 'left_filled',
    hl = {
      fg = 'red'
    }
  },
  right_sep = {
    str = 'left_filled',
    hl = {
      fg = 'bg',
      bg = 'red'
    }
  }
})

table.insert(components.active[3], {
  provider = 'diagnostic_warnings',
  icon = '',
  hl = {
    fg = 'black',
    bg = 'yellow'
  },
  left_sep = {
    str = 'left_filled',
    hl = {
      fg = 'yellow'
    }
  },
  right_sep = {
    str = 'left_filled',
    hl = {
      fg = 'bg',
      bg = 'yellow'
    }
  }
})

table.insert(components.active[3], {
  provider = 'diagnostic_hints',
  icon = '',
  hl = {
    fg = 'black',
    bg = 'skyblue'
  },
  left_sep = {
    str = 'left_filled',
    hl = {
      fg = 'skyblue'
    }
  },
  right_sep = {
    str = 'left_filled',
    hl = {
      fg = 'bg',
      bg = 'skyblue'
    }
  },
})

-- Encoding
table.insert(components.active[3], {
  provider = 'file_encoding',
  left_sep = {
    str = 'left_filled',
    hl = {
      fg = 'grey2'
    }
  },
  hl = {
    bg = 'grey2',
    fg = 'white'
  }
})

-- File Type
table.insert(components.active[3], {
  provider = 'file_type',
  left_sep = {
    str = ' ',
    hl = {
      bg = 'grey2'
    }
  },
  right_sep = {
    str = ' ',
    hl = {
      bg = 'grey2'
    }
  },
  hl = {
    bg = 'grey2',
    fg = 'skyblue'
  }
})

-- File position
table.insert(components.active[3], {
  provider = 'position',
  left_sep = {
    str = '',
    hl = {
      bg = 'grey2',
      fg = 'fg'
    }
  },
  hl = {
    fg = 'bg',
    bg = 'fg'
  }
})

-- line percentage
table.insert(components.active[3], {
  provider = 'line_percentage',
  left_sep = {
    str = ' ',
    hl = {
      bg = 'fg',
      fg = 'bg'
    }
  },
  hl = {
    fg = 'bg',
    bg = 'fg'
  }
})

-- Scroll bar
table.insert(components.active[3], {
  provider = 'scroll_bar',
  reverse = false,
  left_sep = {
    str = ' ',
    hl = {
      bg = 'fg'
    }
  },
  hl = {
    bg = 'fg',
    fg = 'black'
  }
})

require('feline').setup({
    components = components,
    theme = colors
})

require('feline').winbar.setup()
