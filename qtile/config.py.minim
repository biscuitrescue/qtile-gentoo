# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

###3from typing import List  # noqa: F401

#####from libqtile import bar, layout, widget
#####from libqtile.config import Click, Drag, Group, Key, Screen
#####from libqtile.lazy import lazy
#####from libqtile.utils import guess_terminal
#####from libqtile.config import Group, Match
#####from libqtile.dgroups import simple_key_binder


#import os
#import re
#import socket
#import subprocess
#import qtilea
#from libqtile.config import Drag, Key, Screen, Group, Drag, Click, Rule
#from libqtile.command import lazy
#from libqtile import layout, bar, widget, hook
#from libqtile.widget import Spacer

import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401

#mod4 or mod = super key
mod = "mod4"
mod1 = "mod1"
mod2 = "control"
mod3  = "shift"
home = os.path.expanduser('~')
myTerm = "kitty"

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

#############################################
############ SHORTCUTS ######################
#############################################


keys = [
    Key([], "F4", lazy.spawn("rofi -show drun")),
    Key([mod], "d", lazy.spawn("dmenu_run -fn 'novamono for powerline-12' -nb '#1b1c26' -nf '#ffffff' -sb '#aed1dc' -sf '#000000' -p 'RUN:'")),
    Key([], "XF86Search", lazy.spawn("dmenu_run -fn 'novamono for powerline-12' -nb '#1b1c26' -nf '#ffffff' -sb '#aed1dc' -sf '#000000' -p 'RUN:'")),


##################################################
################# MEDIA CONTROLS #################
##################################################

# INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("light -A 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("light -U 5")),



    # Switch between windows in current stack pane
###################################################
################  SWITCH LAYOUT ###################
###################################################

# TOGGLE FLOATING LAYOUT
    Key([mod, "control"], "a", lazy.window.toggle_floating()),

    # CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "o", lazy.layout.left()),
    Key([mod], "p", lazy.layout.right()),
    Key([mod], "l",lazy.layout.grow(), lazy.layout.increase_nmaster()),
    Key([mod], "m", lazy.layout.shrink(), lazy.layout.decrease_nmaster()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "w", lazy.window.toggle_fullscreen()),
# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    Key([mod], "period", lazy.layout.next()),
    Key([mod], "s", lazy.layout.next()),
    Key([mod], "comma", lazy.layout.previous()),

#########################################
############### BSPWM ###################
#########################################
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),
    Key([mod, "mod1"], "Down", lazy.layout.flip_down()),
    Key([mod, "mod1"], "Up", lazy.layout.flip_up()),
    Key([mod, "mod1"], "Left", lazy.layout.flip_left()),
    Key([mod, "mod1"], "Right", lazy.layout.flip_right()),
    Key([mod, "control"], "Down", lazy.layout.grow_down()),
    Key([mod, "control"], "Up", lazy.layout.grow_up()),
    Key([mod, "shift"], "l", lazy.layout.grow_left()),
    Key([mod, "shift"], "m", lazy.layout.grow_right()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),
    Key([mod], "z", lazy.layout.toggle_split()),



# Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "a", lazy.prev_layout()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod], "c", lazy.restart()),
    Key([mod], "r", lazy.spawncmd()),
    Key([mod, "shift"], "x", lazy.spawn("poweroff")),
##############################################
############## SCREENSHOTS ###################
##############################################

    Key([], "Print", lazy.spawn("scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`'")),
    Key(["shift"], "Print", lazy.spawn("scrot -s 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`'")),
#####################3#########################
############## APPLICATIONS ###################
###############################################

    Key([mod], "space", lazy.spawn("st")),
    Key([mod, "shift"], "s", lazy.spawn("spotify")),
    Key([], "XF86Tools", lazy.spawn("spotify")),
    Key([mod, "shift"], "space", lazy.spawn("pcmanfm")),
    Key([mod, "shift"], "i", lazy.spawn("betterlockscreen -l")),
    Key([mod, "shift"], "a", lazy.spawn("i3lock -c 000000")),
    Key([], "F6", lazy.spawn("i3lock -i Pictures/Wallpapers/black.jpeg")),
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "KP_Enter", lazy.spawn(myTerm)),
    Key([mod], "v", lazy.spawn("pavucontrol")),
    Key([mod], "e", lazy.spawn("emacs")),

    KeyChord([mod], "i",[
        Key([], "f", lazy.spawn("firefox")),
        Key([], "v", lazy.spawn("vivaldi-stable")),
        Key([], "b", lazy.spawn("brave")),
        Key([], "l", lazy.spawn("librewold")),
    ]),
    ]

groups= [
    Group("1",
          label="I",
          spawn='vivaldi-stable',
          # spawn='firefox',
          matches=[Match(wm_class=["firefox"]),
                   Match(wm_class=["Vivaldi-stable"]),
                   ],
          ),

    Group("2",
          label="II",
          matches=[Match(wm_class=["Zathura"]),
                   Match(wm_class=["Evince"]),
                   ],
          ),

    Group("3",
          label="III",
          matches=[Match(wm_class=["st-256color"]),
                   # Match(wm_class=["kitty"]),
                   ],
          ),

    Group("4",
          label="IV",
          matches=[Match(wm_class=["discord"]),
                   ],
          ),

    Group("5",
          label="V",
          layout="max",
          matches=[Match(wm_class=["Mplayer"]),
                   ],
          ),

    Group("6",
          label="VI",
          matches=[Match(wm_class=["pcmanfm"]),
                   ],
          ),

    Group("7",
          label="VII",
          layout="bsp",
          matches=[Match(wm_class=["pavucontrol"]),
                   ],
          ),

    Group("8",
          label="VIII",
          matches=[Match(wm_class=["emacs"]),
                   ],
          ),

    Group("9",
          label="IX",
          layout="max",
          matches=[Match(wm_class=["zoom"]),
                   Match(wm_class=["Microsoft Teams - Preview"]),
                   ],
          ),

    Group("0",
          label="X"),
]

for i in range(len(groups)):
   keys.append(Key([mod], str((i)), lazy.group[str(i)].toscreen()))
   keys.append(Key([mod, "shift"], str((i)), lazy.window.togroup(str(i), switch_group=False)))
   keys.append(Key([mod1, "shift"], str((i)), lazy.window.togroup(str(i), switch_group=True)))

# LAYOUTS
layouts = [
    # layout.Stack(num_stacks=2),
    # layout.Columns(margin=7, border_width=4, border_focus="#ffffff", border_normal="#4c566a", ),
    # layout.Matrix(),
    # layout.RatioTile(margin=7)
    # layout.VerticalTile(),
    # layout.Zoomy(
    #    margin=7,
    #    columnwidth=300,
    # ),
    # layout.TreeTab(
    #        active_bg = 'ffffff',
    #        active_fg = '000000',
    #        bg_color = '293136',
    #        font = 'novamono for powerline',
    #        fontsize = 15,
    #        panel_width = 200,
    #        inactive_bg = 'a1acff',
    #        inactive_fg = '000000',
    #        sections = ['Qtile'],
    #        section_fontsize = 18,
    #       section_fg = 'ffffff',
    #        section_left = 70
    # ),
    # layout.Tile(margin=7, border_width=3, border_focus="#ffffff", border_normal="#4c566a", new_client_position='top', ratio=0.55),
    layout.MonadTall(margin=15, border_width=0, border_focus="#bc7cf7", border_normal="#4c566a"),
    layout.MonadWide(margin=15, border_width=0, border_focus="#bc7cf7", border_normal="#4c566a"),
    layout.Bsp      (margin=10, border_width=0, border_focus="#bc7cf7", border_normal="#4c566a", fair=False),
    layout.Max(),
]


colors =  [

        ["#292d3e", "#292d3e"], # color 0
        ["#A8A8A8", "#A8A8A8"], # color 1
        ["#f99db3", "#f99db3"], # color 2
        ["#b1b6ff", "#b1b6ff"], # color 3
        ["#f984a0", "#f984a0"], # color 4
        ["#ffffff", "#ffffff"], # color 5
        ["#B9BCDF", "#B9BCDF"], # color 6
        ["#f9678a", "#f9678a"], # color 7
        ["#c6c9ef", "#c6c9ef"], # color 8
        ["#bbebca", "#bbebca"]] # color 9

widget_defaults = dict(
    font='novamono for Powerline',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='/home/karttikeya/Pictures/Wallpapers/doge-nord.png',
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    scale=0.45,
                    padding=0,
                ),
                widget.TextBox(
                    text='|',
                    padding=0,
                    foreground=colors[5],
                ),
                widget.GroupBox(
                    font="space mono for powerline",
                    fontsize=13,
                    # hide_unused=True,
                    margin_y=3,
                    margin_x=4,
                    padding_y=5,
                    padding_x=4,
                    borderwidth=6,
                    active=colors[9],
                    inactive=colors[1],
                    rounded=True,
                    highlight_color=colors[0],
                    highlight_method="text",
                    this_current_screen_border=colors[4],
                    block_highlight_text_color=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    padding=0,
                    foreground=colors[5],
                ),
                widget.Prompt(
                    background=colors[8],
                    foreground=colors[0],
                    font="Novamono for Powerline",
                    fontsize=16,
                ),


                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                        name_transform=lambda name: name.upper(),
                ),

                widget.WindowName(
                    fontsize=14,
                ),

                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.Systray(
                    background=colors[0],
                    icons_size=20,
                    padding=4,
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[8],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text="",
                    font="FontAwesome",
                    foreground=colors[8],
                    background=colors[0],
                    padding=0,
                    fontsize=16
                ),
                widget.Memory(
                    background=colors[0],
                    foreground=colors[8],
                    font="novamono for powerline",
                    fontsize=14,
                    format='{MemUsed: .0f} MB'
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[6],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text="  ",
                    font="FontAwesome",
                    foreground=colors[6],
                    background=colors[0],
                    padding=0,
                    fontsize=18
                ),
                widget.CPU(
                    background=colors[0],
                    foreground=colors[6],
                    font="novamono for powerline",
                    fontsize=14,
                    format='CPU: {load_percent}%'
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[9],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.Volume(
                    background=colors[0],
                    foreground=colors[9],
                    font="novamono for powerline",
                    fontsize=14,
                    mouse_callbacks={'Button3': lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[2],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='  ',
                    font="fontawesome",
                    fontsize='14',
                    padding=0,
                    background=colors[0],
                    foreground=colors[2],
                ),
                widget.Clock(
                    font="novamono for powerline",
                    foreground=colors[2],
                    background=colors[0],
                    fontsize=14,
                    format='%d %b, %A',
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[4],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='   ',
                    font="fontawesome",
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[4],
                ),
                widget.Clock(
                    font="novamono for powerline",
                    foreground=colors[4],
                    background=colors[0],
                    fontsize=14,
                    format='%I:%M %p'
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.TextBox(
                    text='|',
                    fontsize='16',
                    padding=0,
                    background=colors[0],
                    foreground=colors[7],
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
                widget.CapsNumLockIndicator(
                    background=colors[0],
                    foreground=colors[7],
                    font="novamono for powerline bold",
                    fontsize=14,
                ),
                widget.Sep(
                    padding=6,
                    linewidth=0,
                    background=colors[0],
                ),
            ],
        31,
            opacity=0.9,
            background=colors[0],
            # margin=[4,4,0,4]
            ),
       ),
    ]
#############################################
############# AUTOSTART #####################
#############################################
@hook.subscribe.startup_once
def autostart():
    processes = [
        ['nm-applet'],
        ['picom'],
    ]

    for p in processes:
        subprocess.Popen(p)


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(

    border_focus="#ffffff",
    border_width=0,
    float_rules=[
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),      # tastyworks exit box
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'About Tor - Tor Browser'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
