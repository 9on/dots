set $mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 8
# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
#bindsym $mod+Return exec i3-sensible-terminal
#bindsym $mod+Return exec urxvt256c

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+g split h

# split in vertical orientation
bindsym $mod+b split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym     $mod+1 workspace 1
bindsym     $mod+2 workspace 2
bindsym     $mod+3 workspace 3
bindsym     $mod+4 workspace 4
bindsym     $mod+5 workspace 5
bindsym     $mod+6 workspace 6
bindsym     $mod+7 workspace 7
bindsym     $mod+8 workspace 8
bindsym     $mod+9 workspace 9
bindsym     $mod+0 workspace 10
bindsym     $mod+m              workspace number 11 www
bindsym     $mod+z              workspace number 11 www
bindcode    $mod+47             workspace number 12 code
bindsym     $mod+x              workspace number 12 code
bindcode    $mod+48             workspace number 13 test
bindsym     $mod+c              workspace number 13 test
bindsym     $mod+t              workspace number 14 T
bindcode    $mod+65             workspace number 14 T
bindsym     $mod+v              workspace number 15 Virtual

# move focused container to workspace
bindsym     $mod+Shift+1 move container to workspace 1
bindsym     $mod+Shift+2 move container to workspace 2
bindsym     $mod+Shift+3 move container to workspace 3
bindsym     $mod+Shift+4 move container to workspace 4
bindsym     $mod+Shift+5 move container to workspace 5
bindsym     $mod+Shift+6 move container to workspace 6
bindsym     $mod+Shift+7 move container to workspace 7
bindsym     $mod+Shift+8 move container to workspace 8
bindsym     $mod+Shift+9 move container to workspace 9
bindsym     $mod+Shift+0 move container to workspace 10
bindsym     $mod+Shift+m            move container to workspace number 11 www
bindsym     $mod+Shift+z            move container to workspace number 11 www
bindcode    $mod+Shift+47           move container to workspace number 12 code
bindsym     $mod+Shift+x            move container to workspace number 12 code
bindcode    $mod+Shift+48           move container to workspace number 13 test
bindsym     $mod+Shift+c            move container to workspace number 13 test
bindsym     $mod+Shift+t            move container to workspace number 14 T
bindcode    $mod+Shift+65           move container to workspace number 14 T
bindsym     $mod+Shift+v            move container to workspace number 15 virtual

# reload the configuration file
bindsym $mod+Shift+r reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
#bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}

#=======================================================
#===CUSTOM STUFF========================================
#=======================================================


#=======================================================
## terminal flotante
exec --no-startup-id gnome-terminal --hide-menubar --name=metask --profile=metask
for_window [instance="gnome-terminal-server"] border 1pixel
for_window [instance="gnome-terminal-server"] floating enable;
for_window [instance="gnome-terminal-server"] move scratchpad; [instance="gnome-terminal-server"] scratchpad show; move position 0px -1px; resize shrink height 0; resize grow width 1000; move scratchpad;
bindcode 49 [instance="gnome-terminal-server"] scratchpad show
bindcode $mod+Shift+49 exec --no-startup-id gnome-terminal --hide-menubar --name=metask --profile=metask
#arreglar el de arriba, porque se abren muchas sesiones de tmux, la idea es establecer una sesion 'consola flotante' estandar


#=======================================================
## cero
exec --no-startup-id i3-msg 'workspace 10; exec st -t cero -e tmux new -s cero; workspace 1'
# arreglar esto, está siendo un fail lo de workspace 10


#=======================================================
## At startup
exec --no-startup-id xbindkeys
exec --no-startup-id redshift -l -33.43:-70.5666
exec --no-startup-id feh --bg-scale $HOME/.bg
exec --no-startup-id synclient TapButton1=1 TapButton2=2 VertScrollDelta=-101
exec --no-startup-id ~/scripts/latam
exec --no-startup-id nm-applet
exec --no-startup-id compton


#=======================================================
## Borderless
## nota: para extraer la clase: xprop
#for_window [class="XTerm"] border none
#for_window [class="yeahconsole"] border none
## Titleless
#for_window [class="Chromium-browser"] border 1pixel
for_window [class="Dwb"] border none
for_window [class="Zathura"] border 1pixel
for_window [class="google-chrome"] border none
for_window [class="Firefox"] border none
for_window [class="Gvim"] border 1pixel
for_window [class="Atom Shell"] border none
for_window [class="Atom"] border none
for_window [class="Vmplayer"] border none
for_window [class="terminology"] border none
for_window [title="cero"] border none
