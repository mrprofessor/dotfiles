-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Style
-------------------------------------------------------------------------------

config.color_scheme = 'Solarized Dark - Patched'

-- Remove all padding
-- config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Font configuration
config.font = wezterm.font 'Cascadia Code NF'
config.font_size = 16.0
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

-- Remove the title bar from the window
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS" 

-- Enable native macOS fullscreen mode
native_macos_fullscreen_mode = true

-- Don't hide cursor when typing
config.hide_mouse_cursor_when_typing = false

-- Customize tab bar style
config.use_fancy_tab_bar = true

-- Slightly transparent and blurred background
config.window_background_opacity = 0.8
config.macos_window_background_blur = 30
config.window_frame = {
  font = wezterm.font({ family = 'Cascadia Code NF', weight = 'Bold' }),
  font_size = 13,
}

wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)


-------------------------------------------------------------------------------
-- Keybindings
-------------------------------------------------------------------------------

config.keys = {
   -- Toggle fullscreen mode with SUPER+ENTER
   { mods = 'SUPER', key = 'Enter', action = wezterm.action.ToggleFullScreen},
   -- Delete whole line with SUPER+BACKSPACE
   { mods = 'SUPER', key = 'Backspace', action = wezterm.action{SendString = '\x15\x08'}},
   -- Move to the beginning of the line with SUPER+LEFT
   { mods = 'SUPER', key = 'LeftArrow', action = wezterm.action{SendString = '\x01'}},
   -- Move to the end of the line with SUPER+RIGHT
   { mods = 'SUPER', key = 'RightArrow', action = wezterm.action{SendString = '\x05'}},
   -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
   -- Source: https://github.com/wez/wezterm/issues/253#issuecomment-672007120
   { mods = 'OPT', key = 'LeftArrow', action=wezterm.action{SendString="\x1bb"}},
   -- Make Option-Right equivalent to Alt-f; forward-word
   { mods = 'OPT', key = 'RightArrow', action=wezterm.action{SendString="\x1bf"}},

   -- Open Wezterm configuration file in Neovim with SUPER+,
   {
      key = ',',
      mods = 'SUPER',
      action = wezterm.action.SpawnCommandInNewTab {
         cwd = wezterm.home_dir,
         args = { 'nvim', wezterm.config_file },
      },
   },

   -- Open command palette with SUPER+P
   {
      key = 'p',
      mods = 'SUPER',
      action = wezterm.action.ActivateCommandPalette
   },
}



-------------------------------------------------------------------------------
-- Hyperlinks
-------------------------------------------------------------------------------

-- URLs in Markdown files are not handled properly by default
-- Source: https://github.com/wez/wezterm/issues/3803#issuecomment-1608954312
config.hyperlink_rules = {
  -- Matches: a URL in parens: (URL)
  {
    regex = '\\((\\w+://\\S+)\\)',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in brackets: [URL]
  {
    regex = '\\[(\\w+://\\S+)\\]',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in curly braces: {URL}
  {
    regex = '\\{(\\w+://\\S+)\\}',
    format = '$1',
    highlight = 1,
  },
  -- Matches: a URL in angle brackets: <URL>
  {
    regex = '<(\\w+://\\S+)>',
    format = '$1',
    highlight = 1,
  },
  -- Then handle URLs not wrapped in brackets
  {
    -- Before
    --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
    --format = '$0',
    -- After
    regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
    format = '$1',
    highlight = 1,
  },
  -- implicit mailto link
  {
    regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
    format = 'mailto:$0',
  },
}

-------------------------------------------------------------------------------
-- Environment Variables
-------------------------------------------------------------------------------
config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}

-- Return the configuration to wezterm
return config
