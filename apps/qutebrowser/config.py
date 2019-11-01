# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = '/Users/mcdodj/Documents/forked_github/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css'

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 10

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '25%'

# Minimum amount of characters needed to update completions.
# Type: Int
c.completion.min_chars = 2

# Which unbound keys to forward to the webview in normal mode.
# Type: String
# Valid values:
#   - all: Forward all unbound keys.
#   - auto: Forward unbound non-alphanumeric keys.
#   - none: Don't forward any keys.
c.input.forward_unbound_keys = 'all'

# Enter insert mode if an editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_enter = False

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = False

# Switch to insert mode when clicking flash and other plugins.
# Type: Bool
c.input.insert_mode.plugins = False

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#323232'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#282828'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#282828'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#83a598'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#282828'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#fabd2f'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#323232'

# Bindings for normal mode
config.bind(',n', 'config-cycle content.user_stylesheets /Users/mcdodj/Documents/forked_github/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
config.bind('0', 'fake-key 0')
config.bind('1', 'fake-key 1')
config.bind('2', 'fake-key 2')
config.bind('3', 'fake-key 3')
config.bind('4', 'fake-key 4')
config.bind('5', 'fake-key 5')
config.bind('6', 'fake-key 6')
config.bind('7', 'fake-key 7')
config.bind('8', 'fake-key 8')
config.bind('9', 'fake-key 9')
config.bind('<Alt+Backspace>', 'fake-key <Ctrl-Backspace>')
config.bind('<Alt+b>', 'fake-key <Ctrl-Left>')
config.bind('<Alt+d>', 'fake-key <Ctrl-Delete>')
config.bind('<Alt+f>', 'fake-key <Ctrl-Right>')
config.bind('<Ctrl+a>', 'fake-key <Home>')
config.bind('<Ctrl+b>', 'fake-key <Left>')
config.bind('<Ctrl+c>O', 'set-cmd-text -s :open -t')
config.bind('<Ctrl+c>b', 'back')
config.bind('<Ctrl+c>f', 'forward')
config.bind('<Ctrl+c>o', 'set-cmd-text -s :open')
config.bind('<Ctrl+d>', 'fake-key <Delete>')
config.bind('<Ctrl+e>', 'fake-key <End>')
config.bind('<Ctrl+f>', 'fake-key <Right>')
config.bind('<Ctrl+g>', 'clear-keychain ;; search ;; fullscreen --leave')
config.bind('<Ctrl+h>', 'set-cmd-text -s :help')
config.bind('<Ctrl+j>', 'tab-prev')
config.bind('<Ctrl+k>', 'tab-next')
config.bind('<Ctrl+n>', 'fake-key <Down>')
config.bind('<Ctrl+p>', 'fake-key <Up>')
config.bind('<Ctrl+r>', 'set-cmd-text ?')
config.bind('<Ctrl+s>', 'set-cmd-text /')
config.bind('<Ctrl+w>', 'fake-key <Ctrl-backspace>')
config.bind('<Ctrl+x><Ctrl+c>', 'quit')
config.bind('<Ctrl+x>b', 'set-cmd-text -s :buffer')
config.bind('<Ctrl+x>k', 'tab-close')
config.bind('<Ctrl+y>', 'insert-text {primary}')
config.bind('<Meta+f>', 'hint all')
config.bind('<Meta+x>', 'set-cmd-text :')
config.bind('d', 'scroll-page 0 0.5')
config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('u', 'scroll-page 0 -0.5')

# Bindings for caret mode
config.bind('<Ctrl+g>', 'leave-mode', mode='caret')

# Bindings for command mode
config.bind('<Alt+n>', 'command-history-next', mode='command')
config.bind('<Alt+p>', 'command-history-prev', mode='command')
config.bind('<Ctrl+g>', 'leave-mode', mode='command')
config.bind('<Ctrl+n>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl+p>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl+r>', 'search-prev', mode='command')
config.bind('<Ctrl+s>', 'search-next', mode='command')

# Bindings for hint mode
config.bind('<Ctrl+g>', 'leave-mode', mode='hint')
