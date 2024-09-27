
################
### MONITORS ###
################
#Laptop
# monitor=eDP-1,highres,auto,1.5

#Desktop
monitor=DP-1, 3840x1600@75, 0x1600, 1
monitor=DP-2, 3840x1600@75, 0x0, 1




###################
### MY PROGRAMS ###
###################
$terminal = kitty
$fileManager = nautilus
$menu = rofi -show drun




#################
### AUTOSTART ###
#################
exec-once = hyprpaper & waybar & nm-applet 
exec-once = synology-drive autostart
exec-once = xdg-user-dirs-update





#############################
### ENVIRONMENT VARIABLES ###
#############################
env = XCURSOR_SIZE,20
env = XDG_CURRENT_DESKTOP, Hyprland
env = XDG_SESSION_TYPE, wayland
env = XDG_SESSION_DESKTOP, Hyprland





#####################
### LOOK AND FEEL ###
#####################
general { 
    gaps_in = 20
    gaps_out = 35
    border_size = 2
    col.active_border = rgba(a277ffff) rgba(ff6767ff) rgba(61ffcaff) rgba(ffca85ff) rgba(f694ffff) rgba(82e2ffff) 90deg
    col.inactive_border = transparent
    resize_on_border = true 
    allow_tearing = false
    layout = dwindle
}

animations {
    enabled = true
    bezier = myBezier, 0.0, 0.0, 1.0, 1.0
    animation = windows, 1, 5, default, slide
    animation = border, 1, 5, default
    animation = borderangle, 1, 90, myBezier, loop
    animation = workspaces, 1, 5, default, slide
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true
    smart_split = true
    force_split = 0
}


gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = on
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    rounding = 10
    dim_special = 0.0
    drop_shadow = no
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}








#############
### INPUT ###
#############

# https://wiki.hyprland.org/Configuring/Variables/#input
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options = caps:backspace
    kb_rules =
        special_fallthrough = true
        follow_mouse = 1
        sensitivity = 0
    numlock_by_default = true
    touchpad {
        natural_scroll = true
        disable_while_typing = true

    }
}


# https://wiki.hyprland.org/Configuring/Variables/#gestures
gestures {
    workspace_swipe = true
    workspace_swipe_touch = true
    workspace_swipe_create_new = true
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device {
#    name = kingston-trackball
#    sensitivity = +0.5
}







####################
### WINDOW RULES ###
####################

windowrule = float, title:^(Picture-in-Picture)$
windowrule = float, title:^(Picture in picture)$
windowrule = size 30% 30%, title:^(Picture-in-Picture)$
windowrule = size 30% 30%, title:^(Picture in picture)$
windowrule = move 69.9% 69.9%, title:^(Picture-in-Picture)$
windowrule = move 69.9% 69.9%, title:^(Picture in picture)$
windowrule = float, title:(Blender)
windowrule = float, title:(Calculator)
windowrule = float, title:(Steam)
windowrule = float, title:(SynoChat)






##############################
### WINDOWS AND WORKSPACES ###
##############################

windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.




####################
### KEYBINDINGSS ###
####################
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Q, killactive
bind = $mainMod SHIFT, Q, exit
bind = $mainMod, W, exec, $terminal
bind = $mainMod, SPACE, exec, $menu
bind = $mainMod, L, exec, hyprlock
bind = ALT, TAB, exec, rofi -show window
bind = $mainMod, RETURN, exec, $fileManager
bind = $mainMod, PRINT, exec, grim -o HDMI-A-2 ~/Pictures/Screenshots/$(date +'%s.png') && nautilus ~/Pictures/Screenshots
bind = $mainMod, F, togglefloating
bind = $mainMod SHIFT, F, fullscreen, 
bind = $mainMod, R, exec, pkill waybar && waybar &

bind = $mainMod, S, exec, yad --html < ~/.config/hypr/keybindings.md --button=OK:0

# Screenshot a region
bind = , PRINT, exec, hyprshot -m region
# Screenshot a window
bind = $shiftMod, PRINT, exec, hyprshot -m window
# Screenshot a monitor
bind = $mainMod, PRINT, exec, hyprshot -m output



# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move focus with mainMod + vim keys
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Move window with mainMod + arrow keys
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Move window with mainMod + vim keys
bind = $mainMod SHIFT, H, movewindow, l
bind = $mainMod SHIFT, L, movewindow, r
bind = $mainMod SHIFT, K, movewindow, u
bind = $mainMod SHIFT, J, movewindow, d

# Resize Window with mainMod + vim keys
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod ALT, left, resizeactive, -100 0
bind = $mainMod ALT, right, resizeactive, 100 0
bind = $mainMod ALT, up, resizeactive, 0, -100
bind = $mainMod ALT, down, resizeactive, 0, 100

# Resize Window with mainMod + vim keys
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod ALT, H, resizeactive, -100 0
bind = $mainMod ALT, L, resizeactive, 100 0
bind = $mainMod ALT, K, resizeactive, 0, -100
bind = $mainMod ALT, J, resizeactive, 0, 100

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Media control
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioPause, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous
bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
bind = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
bind = , XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle

# Brightness control
bind = ,XF86MonBrightnessUp, exec, brightnessctl set 10%+
bind = ,XF86MonBrightnessDown, exec, brightnessctl set 10%-
