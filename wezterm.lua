-- Inspired from https://alexplescan.com/posts/2024/08/10/wezterm/

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-------------------------------------------------------------------------------
-- Overall Style
-------------------------------------------------------------------------------

--config.color_scheme = 'Catppuccin Moch'
config.color_scheme = 'Sakura'

-- Remove all padding
-- config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Font configuration
-- config.font = wezterm.font 'Iosevka'
config.font = wezterm.font 'Cascadia Code NF'
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.font_size = 17.0

-- Remove the title bar from the window
config.window_decorations = "RESIZE"  -- |INTEGRATED_BUTTONS

-- Enable native macOS fullscreen mode
native_macos_fullscreen_mode = true

-- Slightly transparent and blurred background
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30

-- Don't hide cursor when typing
config.hide_mouse_cursor_when_typing = false

config.default_workspace = "home"

-------------------------------------------------------------------------------
-- Tab Bar
-------------------------------------------------------------------------------

-- Customize tab bar style
config.use_fancy_tab_bar = false

wezterm.on('update-right-status', function(window, pane)
    local icon = utf8.char(0x2699,0xFE0F)
    -- local icon = wezterm.nerdfonts.fa_bars_progress
    window:set_right_status(wezterm.format {
        { Text = '  ' .. icon .. ' ' }  -- Adding spaces before and after
    })
end)


-- Will only work with use_fancy_tab_bar = true
-- config.window_frame = {
--   font = wezterm.font({ family = 'Cascadia Code NF', weight = 'Bold' }),
--   font_size = 13,
-- }

-- Options if I feel like it in the future
config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true


-------------------------------------------------------------------------------
-- Keybindings
-------------------------------------------------------------------------------

config.keys = {

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

   -- Clears the scrollback and viewport leaving the prompt line the new first line
   -- https://github.com/wez/wezterm/issues/3940 (They were using uppercase K)
   {
      key = 'k',
      mods = 'CMD',
      action = wezterm.action.ClearScrollback('ScrollbackAndViewport'),
   },

   -- Toggle fullscreen mode with SUPER+ENTER
   {
      mods = 'SUPER',
      key = 'Enter',
      action = wezterm.action.ToggleFullScreen
   },

   -- Open Wezterm configuration file in Neovim with SUPER+,
   {
      mods = 'SUPER',
      key = ',',
      action = wezterm.action.SpawnCommandInNewTab {
         cwd = wezterm.home_dir,
         args = { 'nvim', wezterm.config_file },
      },
   },

   -- Open command palette with SUPER+P
   {
      mods = 'SUPER',
      key = 'p',
      action = wezterm.action.ActivateCommandPalette
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
