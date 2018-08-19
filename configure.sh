#! /bin/bash

# run with 'sudo'

wget https://psv4.userapi.com/c848028/u18270521/docs/d18/1a434a7ec7f9/729088.jpg -O ~/Downloads/wp.jpg

wget https://psv4.userapi.com/c848232/u18270521/docs/d14/e363c0d02f9f/wallpaper_wiki-Free-HD-Dark-Photos-1920x1080-PIC-WPD009331.jpg -O ~/Downloads/ls.jpg

mogrify -format png Downloads/ls.jpg
rm ~/Downloads/ls.jpg

sudo apt install curl

packages="xserver-xorg-input-synaptics gparted iverilog xbacklight i3 feh sudo meld smartgit code git krusader gcc sublime-text virtualbox"
repos="ppa:eugenesan/ppa ppa:webupd8team/java"

# pre_commands:
for repo in $repos
do
sudo add-apt-repository -y $repo
done

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update

for package in $packages
do
sudo apt install -y $package
done

sudo apt-get -y install oracle-java8-installer

#configuring i3

sudo touch ~/.config/i3/config
echo "# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)

set \$mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+\$mod to drag floating windows to their wanted position
floating_modifier \$mod

# start a terminal
bindsym \$mod+Return exec i3-sensible-terminal

# kill focused window
bindsym \$mod+Shift+q kill

# start dmenu (a program launcher)
bindsym \$mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym \$mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym \$mod+j focus left
bindsym \$mod+k focus down
bindsym \$mod+l focus up
bindsym \$mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym \$mod+Left focus left
bindsym \$mod+Down focus down
bindsym \$mod+Up focus up
bindsym \$mod+Right focus right

# move focused window
bindsym \$mod+Shift+j move left
bindsym \$mod+Shift+k move down
bindsym \$mod+Shift+l move up
bindsym \$mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym \$mod+Shift+Left move left
bindsym \$mod+Shift+Down move down
bindsym \$mod+Shift+Up move up
bindsym \$mod+Shift+Right move right

# split in horizontal orientation
bindsym \$mod+h split h

# split in vertical orientation
bindsym \$mod+v split v

# enter fullscreen mode for the focused container
bindsym \$mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym \$mod+s layout stacking
bindsym \$mod+w layout tabbed
bindsym \$mod+e layout toggle split

# toggle tiling / floating
bindsym \$mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym \$mod+space focus mode_toggle

# focus the parent container
bindsym \$mod+a focus parent

# focus the child container
#bindsym \$mod+d focus child

# switch to workspace
bindsym \$mod+1 workspace 1
bindsym \$mod+2 workspace 2
bindsym \$mod+3 workspace 3
bindsym \$mod+4 workspace 4
bindsym \$mod+5 workspace 5
bindsym \$mod+6 workspace 6
bindsym \$mod+7 workspace 7
bindsym \$mod+8 workspace 8
bindsym \$mod+9 workspace 9
bindsym \$mod+0 workspace 10

# move focused container to workspace
bindsym \$mod+Shift+1 move container to workspace 1
bindsym \$mod+Shift+2 move container to workspace 2
bindsym \$mod+Shift+3 move container to workspace 3
bindsym \$mod+Shift+4 move container to workspace 4
bindsym \$mod+Shift+5 move container to workspace 5
bindsym \$mod+Shift+6 move container to workspace 6
bindsym \$mod+Shift+7 move container to workspace 7
bindsym \$mod+Shift+8 move container to workspace 8
bindsym \$mod+Shift+9 move container to workspace 9
bindsym \$mod+Shift+0 move container to workspace 10

# Volume
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +1% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -1% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# keybord light
bindsym XF86KbdBrightnessUp exec python3 /usr/local/bin/kb-light.py +
bindsym XF86KbdBrightnessDown exec python3 /usr/local/bin/kb-light.py -

# Touchpad controls
#bindsym XF86TouchpadToggle exec /usr/local/bin/toggle-touchpad.sh # toggle touchpad

# Brightness
bindsym XF86MonBrightnessUp exec xbacklight -inc 5 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 5 # decrease screen brightness


# layouts
bindcode \$mod+Shift+34 exec \"setxkbmap -layout 'us'\"
bindcode \$mod+Shift+35 exec \"setxkbmap -layout 'ru'\"

# reload the configuration file
bindsym \$mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym \$mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym \$mod+Shift+e exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do youreally want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"

bindsym \$mod+Shift+s exec \"i3lock -i /home/dranitsaal/Downloads/ls.png && systemctl suspend\"
bindsym \$mod+Shift+b exec \"i3lock -i /home/dranitsaal/Downloads/ls.png -p default -n\"

# resize window (you can also use the mouse for that)
mode \"resize\" {
# These bindings trigger as soon as you enter the resize mode

# Pressing left will shrink the window’s width.
# Pressing right will grow the window’s width.
# Pressing up will shrink the window’s height.
# Pressing down will grow the window’s height.
bindsym j resize shrink width 10 px or 10 ppt
bindsym k resize grow height 10 px or 10 ppt
bindsym l resize shrink height 10 px or 10 ppt
bindsym semicolon resize grow width 10 px or 10 ppt

# same bindings, but for the arrow keys
bindsym Left resize shrink width 10 px or 10 ppt
bindsym Down resize grow height 10 px or 10 ppt
bindsym Up resize shrink height 10 px or 10 ppt
bindsym Right resize grow width 10 px or 10 ppt

# back to normal: Enter or Escape
bindsym Return mode \"default\"
bindsym Escape mode \"default\"
}

bindsym \$mod+r mode \"resize\"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

bar {
	status_command i3status
	position top

	colors {
		background #000000
		statusline #ffffff
		separator #999999

		focused_workspace #4c7899 #285577 #ffffff
		active_workspace #333333 #5f676a #ffffff
		inactive_workspace #333333 #222222 #888888
		urgent_workspace #2f343a #900000 #ffffff
		binding_mode #2f343a #900000 #ffffff
	}

}

exec feh --bg-scale /home/dranitsaal/Downloads/wp.jpg

exec synclient VertScrollDelta=-79
exec synclient HorizScrollDelta=-79" > ~/.config/i3/config

sudo touch /etc/i3status.conf
sudo echo "
# i3status configuration file
# see \"man i3status\" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
colors = true
color_good = \"#BBBBBB\"
color_bad = \"#CC1616\"
color_degraded = \"#55858E\"
interval = 2
}

order += \"volume master\"
#order += \"load\"
order += \"cpu_usage\"
order += \"cpu_temperature 0\"
order += \"cpu_temperature 1\"
order += \"cpu_temperature 2\"
order += \"cpu_temperature 3\"
order += \"disk /\"
order += \"disk /home\"
order += \"disk /media/media\"
order += \"wireless wlp2s0\"
order += \"ethernet l0\"
order += \"battery 0\"
order += \"tztime local\"
#order += \"ipv6\"
#order += \"run_watch DHCP\"
#order += \"run_watch VPN\"

volume master {
#format = \" ♪ %volume \"
format = \" VOL %volume \"
device = \"default\"
mixer = \"Master\"
mixer_idx = 0
# termsyn font
# format = \"À %volume \"
}

load {
# format = \" Δ: %1min \"
# termsyn font
format = \" Î %1min\"
}

cpu_usage {
	format = \" CPU %usage \"
}

cpu_temperature 0 {
	format = \" %degrees°\"
	path = \"/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input\"
	max_threshold = 95
}

cpu_temperature 1 {
	format = \" %degrees°\"
	path = \"/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp2_input\"
	max_threshold = 95
}

cpu_temperature 2 {
	format = \" %degrees°\"
	path = \"/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp3_input\"
	max_threshold = 95
}

cpu_temperature 3 {
	format = \" %degrees° \"
	path = \"/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp4_input\"
	max_threshold = 95
}

disk "/" {
	format = \" / %avail free \" 
}

disk \"/home\" {
	format = \" /h %avail free \" 
}

disk \"/media/media\" {
format = \" ¨ %avail:m \"
}

wireless wlp2s0 {
format_up = \" W: (%quality at %essid) %ip \"
format_down = \" ☡ WiFi \"
}

ethernet l0 {
# if you use %speed, i3status requires root privileges
format_up = \" Ω: %ip \"
format_down = \" ∅ eth0 \"

# termsyn font
# format_up = \" %ip \"
# format_down = \" Ð eth0 \"
}

run_watch DHCP {
pidfile = \"/var/run/dhclient*.pid\"
}

run_watch VPN {
pidfile = \"/var/run/vpnc/pid\"
}

tztime local {
format = \" %Y-%m-%d %H:%M:%S\"
}

battery 0 {
#format = \"%status %percentage %remaining %emptytime\"
format = \"%status %percentage %remaining\"
format_down = \"No battery\"
status_chr = \"⚡ CHR\"
status_bat = \"🔋 BAT\"
status_unk = \"? UNK\"
status_full = \"FULL\"
path = \"/sys/class/power_supply/BAT%d/uevent\"
low_threshold = 10
}" > /etc/i3status.conf

sudo touch /usr/local/bin/kb-light.py
sudo echo "#!/usr/bin/env python3

import dbus
import sys

def kb_light_set(delta):
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = kbd_backlight.GetBrightness()
    maximum = kbd_backlight.GetMaxBrightness()
    new = max(0, min(current + delta, maximum))

    if 0 <= new  <= maximum:
        current = new
        kbd_backlight.SetBrightness(current)

    # Return current backlight level percentage
    return 100 * current / maximum

if __name__ ==  '__main__':
    if len(sys.argv) == 2 or len(sys.argv) == 3:
        if sys.argv[1] == \"--up\" or sys.argv[1] == \"+\":
            if len(sys.argv) == 3:
                print(kb_light_set(int(sys.argv[2])))
            else:
                print(kb_light_set(17))
        elif sys.argv[1] == \"--down\" or sys.argv[1] == \"-\":
            if len(sys.argv) == 3:
                print(kb_light_set(-int(sys.argv[2])))
            else:
                print(kb_light_set(-17))
        else:
            print(\"Unknown argument:\", sys.argv[1])
    else:
        print(\"Script takes one or two argument.\", len(sys.argv) - 1, \"arguments provided.\")" > /usr/local/bin/kb-light.py

sudo touch /etc/X11/xorg.conf
sudo echo "Section \"Device\"
    Identifier \"Card0\"
    Driver \"intel\"
    Option \"Backlight\" \"intel_backlight\"
EndSection" > /etc/X11/xorg.conf

sudo systemctl disable bluetooth.service
