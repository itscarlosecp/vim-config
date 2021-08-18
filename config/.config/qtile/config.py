### IMPORTS ###
from typing import List
import subprocess

from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy



### QTILE VARIABLES ###
# Variables that are used in qtile's default config
mod = "mod4"
terminal = "kitty"



### CONFIG VARIABLES ###
# Custom varibles referenced in my custom config
fg       = "#dddddd"
bg0      = "#171717"
active   = "#978771"
inactive = "#666666"

border_width = 2
gaps_size    = 12

date_format = "  %d/%m/%y - %H:%M"

### GLOBAL SETTINGS ###
# Qtile's global settings
auto_fullscreen   = True  # If an app request fullscreen it is automatically fullscreened.
bring_front_click = False # Bring floating app to the front on click.
follow_mouse_focus = True # Focus on hover
cursor_warp       = False



### KEYMAPPINGS ###
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    # Reset windows size
    Key([mod], "0", lazy.layout.normalize()),

    # Terminal
    Key([mod], "Return", lazy.spawn(terminal)),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "c", lazy.window.kill()),

    # Qtile Actions
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    # Run Command
    # Using Dmenu to run commands
    Key([mod], "p", lazy.run_extension(extension.DmenuRun(
        background = bg0
        ))),

    # Media Keys
    # Volumne Control
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse set Master 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse set Master 5%-")),
    Key([], "XF86AudioMute",        lazy.spawn("amixer -D pulse set Master 1+ toggle")),

    # Play/Pause Keys
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # PrintScr Key
    Key([], "Print", lazy.spawn("flameshot gui")),
]



### GROUPS ###
# Qtiles workspeces
# Define group names and settings
# You can get a window class with `xprop`
group_names = [
        ("  DEV",   {
            "layout": "monadtall",
            "matches": [Match(wm_class="kitty")]
            }),
        ("  BRWSR", {
            "layout": "monadtall",
            "matches": [Match(wm_class="brave-browser")]
            }),
        ("  MSG",   {"layout": "monadtall"}),
        ("  SPTFY", {"layout": "monadtall"}),
        ("  OBS", {
            "layout": "monadtall",
            "matches": [Match(wm_class="obs")]
            }),
        ]

# Register groups
groups = [Group(name, **kwargs) for name,kwargs in group_names]

# Register keybinds to use activeted groups
for i,(name,kwargs) in enumerate(group_names, 1):
    keys.extend([
        # Visit specified group
        Key([mod], str(i), lazy.group[name].toscreen()),
        # Send current window to specified group
        Key([mod, "shift"], str(i), lazy.window.togroup(name, switch_group = True)),
    ])



### LAYOUTS ###
# Configs for every layout
layout_theme = {
        "border_focus":  active,
        "border_normal": inactive,
        "border_width":  border_width,
        "margin": gaps_size
        }

# Layout definitions
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Max(),
]



### SCREENS ###
# Widget Defaults
widget_defaults = dict(
    foreground = fg,
    background = bg0,
    font = "sans",
    fontsize = 14,
    padding = 4,
)
extension_defaults = widget_defaults.copy()

# Widget List
widget_list = [
        widget.Sep(
            linewidth  = 0,
            padding    = 6,
            ),
        widget.GroupBox(
            # Whole Widget
            highlight_method = "block",
            rounded = False,
            margin = 3,

            # Group-specifics
            active = fg,
            inactive = inactive,
            # Current Screen: Focused
            this_current_screen_border = active,
            # Current Screen: Unfocused
            # Groups visibles in screens that don't have focus
            this_screen_border = bg0,
            # Others Screens: Focused
            other_current_screen_border = active,
            # Others Screens: Hidden
            other_screen_border = bg0,
            ),
        widget.WindowName(
            foreground = inactive,
            for_current_screen = True
            ),
        widget.CurrentLayout(
            fmt = "   {}"
            ),
        widget.Systray(),
        widget.Clock(format = date_format),
        widget.Volume(fmt = "  {}"),
        widget.Battery(fmt = " {}"),
        widget.QuickExit(
            font = "CaskaydiaCove Nerd Font",
            fmt = "[襤 EXIT]",
            padding = 3,
            countdown_start = 0,
            foreground = active
            ),
        widget.Sep(
            linewidth  = 0,
            padding    = 6,
            ),
        ]

screens = [
    # Laptop Screen
    Screen(top = bar.Bar(widget_list.copy(), 24)),
    Screen(top = bar.Bar(widget_list.copy(), 24)),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class = "confirmreset"),  # gitk
    Match(wm_class = "makebranch"),  # gitk
    Match(wm_class = "maketag"),  # gitk
    Match(wm_class = "ssh-askpass"),  # ssh-askpass
    Match(title = "branchdialog"),  # gitk
    Match(title = "pinentry"),  # GPG key password entry
])
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We"re lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn"t work correctly. We may as well just lie
# and say that we"re a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java"s whitelist.
wmname = "LG3D"


### STARTUP ###
# Autostart processes
@hook.subscribe.startup_once
def autostart():
    processes = [
            ["nitrogen", "--restore"],
            ]

    for proc in processes:
        subprocess.Popen(proc)
