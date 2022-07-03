local vi_utils = require('feline.providers.vi_mode')
local git_utils = require('feline.providers.git')

local function git_exists()
  if require('feline.providers.git').git_info_exists() then
    return true
  else
    return false
  end
end

local components = {
  active = {},
  inactive = {}
}

local colors = {
  --bg = '#282828',
  bg = '#3c3836',
  black = '#1d2021',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#ebdbb2',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local default_git_hl = {
  bg = colors.bg
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
          fg = vi_utils.get_mode_color()
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
      type = 'unique-short'
    }
  },
  hl = {
    fg = 'cyan'
  },
})
-- GIT
table.insert(components.active[1], {
  provider = 'git_branch',
  hl = {
        bg = 'black',
        fg = 'violet'
  },
  left_sep = {
    str = '  ',
    hl = {
      fg = 'black'
    }
  }
})

table.insert(components.active[1], {
  provider = 'git_diff_added',
  hl = function()
    if git_utils.git_info_exists() then
      return {
        bg = 'black',
        fg = 'green'
      } else return {
        bg = bg
      }
    end
  end
})

table.insert(components.active[1], {
  provider = 'git_diff_removed',
  hl = {
    bg = 'black',
    fg = 'red'
  },
  enabled = git_exists
})

table.insert(components.active[1], {
  provider = 'git_diff_changed',
  hl = {
    bg = 'black',
    fg = 'yellow'
  },
  right_sep = {
    str = '  ',
    hl = {
      fg = 'black'
    }
  },
  enabled = git_exists
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
  }
})

table.insert(components.active[3], {
  provider = 'diagnostic_warnings',
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
  }
})

-- Encoding
table.insert(components.active[3], {
  provider = 'file_encoding',
  hl = {
    fg = 'white'
  }
})

-- File position
table.insert(components.active[3], {
  provider = 'position',
  left_sep = ' ',
  hl = {
    fg = 'white'
  }
})

-- line percentage
table.insert(components.active[3], {
  provider = 'line_percentage',
  left_sep = ' ',
  hl = {
    fg = 'white'
  }
})

-- Scroll bar
table.insert(components.active[3], {
  provider = 'scroll_bar',
  reverse = false,
  left_sep = ' '
})

require('feline').setup({
    components = components,
    theme = colors
})
