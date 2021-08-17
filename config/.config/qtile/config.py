### IMPORTS ###
from typing import List

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


### QTILE VARIABLES ###
# Variables that are used in qtile's default config
mod = "mod4"
terminal = "kitty"


### CONFIG VARIABLES ###
# Custom varibles referenced in my custom config
border_focus_color = "#d75f5f"
border_normal_color = "#d75f5f"
border_width = 2
gaps_size = 8

### GLOBAL SETTINGS ###
# Qtile's global settings
auto_fullscreen   = True  # If an app request fullscreen it is automatically fullscreened.
bring_front_click = False # Bring floating app to the front on click.
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
    # Run command
    Key([mod], "p", lazy.spawncmd())
]


### GROUPS ###
# Qtiles workspeces
# Define group names and settings
group_names = [
        ("WWW", {"layout": "monadtall"}),
        ("DEV", {"layout": "monadtall"}),
        ]

# Register groups
groups = [Group(name, **kwargs) for name,kwargs in group_names]

# Register keybinds to use activeted groups
for i,(name,kwargs) in enumerate(group_names, 1):
    keys.extend([
        # Visit specified group
        Key([mod], str(i), lazy.group[name].toscreen()),
        # Send current window to specified group
        Key([mod, "shift"], str(i), lazy.window.togroup(name, switch_group=True)),
    ])


### LAYOUTS ###
# Configs for every layout
layout_theme = {
        "border_focus":  border_focus_color,
        "border_normal": border_normal_color,
        "border_width":  border_width,
        "margin": gaps_size
        }

# Layout definitions
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Max(),
]


widget_defaults = dict(
    font = "sans",
    fontsize = 14,
    padding = 4,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            24,
        ),
    ),
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
follow_mouse_focus = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class="confirmreset"),  # gitk
    Match(wm_class="makebranch"),  # gitk
    Match(wm_class="maketag"),  # gitk
    Match(wm_class="ssh-askpass"),  # ssh-askpass
    Match(title="branchdialog"),  # gitk
    Match(title="pinentry"),  # GPG key password entry
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
