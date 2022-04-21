import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


MOD = "mod4"
TERMINAL = "alacritty"
EDITOR = "nvim"
HOME = os.path.expanduser("~")
SCRIPTS_DIR = f"{HOME}/.config/shell/scripts"

COLORS = {
    "black": "#161925",
    "red": "#F28FAD",
    "green": "#ABE9B3",
    "yellow": "#FAE3B0",
    "blue": "#96CDFB",
    "magenta": "#F5C2E7",
    "cyan": "#89DCEB",
    "grey": "#6E6C7E",
    "white": "#D9E0EE",
}
POWERLINE_SYMBOL = "\ue0be"

keys = [
    ###
    ### Switch focus between windows in a workspace
    ###
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    ###
    ### Move the focused window within a workspace
    ###
    Key([MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window left"),
    Key([MOD, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window right"),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    ###
    ### Manage window sizes
    ###
    Key([MOD, "control"], "h", lazy.layout.shrink(), desc="Shrink window"),
    Key([MOD, "control"], "l", lazy.layout.grow(), desc="Grow window"),
    Key(
        [MOD, "shift"],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen for window",
    ),
    Key(
        [MOD, "control"],
        "f",
        lazy.window.toggle_floating(),
        desc="Toggle Floating mode for window",
    ),
    ###
    ### Hotkeys
    ###
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key(
        [MOD, "shift"],
        "Return",
        lazy.spawn(f"{TERMINAL} -e ssh ashish@atlas"),
        desc="Launch ssh session to home server.",
    ),
    Key([MOD], "b", lazy.spawn("firefox"), desc="Launch browser"),
    Key([MOD], "v", lazy.spawn("code"), desc="Launch VSCode"),
    Key([MOD], "d", lazy.spawn("discord"), desc="Launch Discord"),
    Key([MOD], "r", lazy.spawn("rofi -show drun"), desc="Launch rofi"),
    Key(
        [MOD],
        "m",
        lazy.spawn(f"{TERMINAL} -e zsh -c 'btm -r 2000'"),
        desc="Launch resource monitor",
    ),
    Key([MOD], "s", lazy.spawn("spotify"), desc="Launch Spotify"),
    Key([MOD], "f", lazy.spawn("flameshot gui"), desc="Launch screenshot tool"),
    Key([MOD], "n", lazy.spawn("pkill -USR1 redshift"), desc="Toggle night light"),
    ###
    ### Hotkeys to scripts
    ###
    Key(
        [MOD],
        "t",
        lazy.spawn(f"bash {SCRIPTS_DIR}/ocr.sh"),
        desc="Perform OCR on image in clipboard and place result in clipboard",
    ),
    Key(
        [MOD],
        "c",
        lazy.spawn(f"bash {SCRIPTS_DIR}/placeholder.sh"),
        desc="Place text in clipboard",
    ),
    ###
    ### Multimedia Keys
    ###
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 -q set Master '10%+'")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 -q set Master '10%-'")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 10%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    ###
    ### Manage Qtile
    ###
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([MOD, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(["control", "shift"], "l", lazy.spawn("slock"), desc="Lock screen"),
    Key(
        [MOD, "shift"],
        "c",
        lazy.spawn(f"{TERMINAL} -e {EDITOR} {HOME}/.config/qtile/config.py"),
        desc="Edit Qtile configuration",
    ),
    ###
    ### Switch monitor focus
    ###
    Key([MOD], "period", lazy.next_screen(), desc="Move focus to next monitor"),
    Key([MOD], "comma", lazy.prev_screen(), desc="Move focus to previous monitor"),
]

#  groups = [Group(i) for i in "1234567890"]
groups = [
    Group(name, **kwargs)
    for name, kwargs in [
        ("WEB", {"matches": [Match(wm_class=["firefox"])]}),
        ("DEV1", {}),
        ("DEV2", {}),
        ("WORK", {}),
        ("SYS", {}),
        ("VM", {}),
        ("RAND", {}),
        ("MUS", {"matches": [Match(wm_class=["spotify"])]}),
        ("VID", {"matches": [Match(wm_class=["mpv"])]}),
        ("DISC", {"matches": [Match(wm_class=["discord"])]}),
    ]
]

for i, group in enumerate(groups, 1):
    keys.extend(
        [
            ###
            ### Switch between workspaces
            ###
            Key(
                [MOD],
                str(i if i != 10 else 0),
                lazy.group[group.name].toscreen(toggle=False),
                desc=f"Switch to group {group.name}",
            ),
            ###
            ### Move focused window to workspace
            ###
            Key(
                [MOD, "shift"],
                str(i if i != 10 else 0),
                lazy.window.togroup(group.name),
                desc=f"Move focused window to group {group.name}",
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        **{
            "border_width": 1,
            "margin": 10,
            "border_focus": COLORS["green"],
            "single_border_width": 0,
        }
    ),
    #  layout.Floating(),
    #  layout.Columns(),
    #  layout.Max(),
    #  layout.Stack(),
    #  layout.Bsp(),
    #  layout.Matrix(),
    #  layout.MonadWide(),
    #  layout.RatioTile(),
    #  layout.Tile(),
    #  layout.TreeTab(),
    #  layout.VerticalTile(),
    #  layout.Zoomy(),
]

widget_defaults = dict(
    font="Ubuntu Mono",
    foreground=COLORS["black"],
    background=COLORS["black"],
    fontsize=14,
    padding=0,
)
extension_defaults = widget_defaults.copy()


def init_widgets():
    return [
        widget.GroupBox(
            borderwidth=3,
            active=COLORS["white"],
            inactive=COLORS["grey"],
            highlight_color=COLORS["black"],
            highlight_method="line",
            this_current_screen_border=COLORS["blue"],
            padding=5,
        ),
        widget.Spacer(),
        widget.Systray(),
        widget.TextBox(
            text=POWERLINE_SYMBOL,
            foreground=COLORS["red"],
            background=COLORS["black"],
            fontsize=25,
        ),
        widget.Volume(background=COLORS["red"], fmt="VOL: {}"),
        widget.TextBox(
            text=POWERLINE_SYMBOL,
            foreground=COLORS["green"],
            background=COLORS["red"],
            fontsize=25,
        ),
        widget.Backlight(
            backlight_name="intel_backlight",
            brightness_file="actual_brightness",
            fmt="BLT: {}",
            background=COLORS["green"],
        ),
        widget.TextBox(
            text=POWERLINE_SYMBOL,
            foreground=COLORS["yellow"],
            background=COLORS["green"],
            fontsize=25,
        ),
        widget.Clock(
            background=COLORS["yellow"],
            format="%A, %B %d - %H:%M ",
        ),
        widget.TextBox(
            text=POWERLINE_SYMBOL,
            fontsize=25,
            foreground=COLORS["blue"],
            background=COLORS["yellow"],
        ),
        widget.Battery(background=COLORS["blue"]),
        widget.TextBox(
            text=POWERLINE_SYMBOL,
            fontsize=25,
            foreground=COLORS["magenta"],
            background=COLORS["blue"],
        ),
        widget.GenPollText(
            fmt="DND: {}",
            func=lambda: "ON"
            if "true"
            in subprocess.check_output(["dunstctl", "is-paused"]).decode("utf-8")
            else "OFF",
            mouse_callbacks={
                "Button1": lambda: subprocess.run(["dunstctl", "set-paused", "toggle"])
            },
            background=COLORS["magenta"],
            padding=5,
            update_interval=1,
        ),
    ]


def init_widgets_screen1():
    widgets_screen = init_widgets()
    # Remove systray on screen 1
    del widgets_screen[2:3]
    return widgets_screen


def init_widgets_screen2():
    widgets_screen = init_widgets()
    return widgets_screen


def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=25)),
        Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=25)),
    ]


screens = init_screens()

mouse = [
    ###
    ### Use mouse only for floating mode.
    ###
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

# Determine which class of windows should be in floating mode.
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)

# Automatically fullscreen a window if it requests it
auto_fullscreen = True

# Automatically minimize a window if it requests it
auto_minimize = True

# Automatically focus window in current group if it requests it
focus_on_window_activation = "smart"

reconfigure_screens = True


@hook.subscribe.startup_once
def start_once():
    subprocess.call([f"{HOME}/.config/qtile/autostart.sh"])


wmname = "Qtile"
