# void-linux package list

## Important Packages

+ neovim
+ git
+ htop
+ curl
+ gcc
+ make
+ cmake
+ xorg-minimal
+ xorg-fonts
+ xrdb
+ i3
+ i3status
+ rxvt-unicode
+ dmenu
+ mesa-dri
+ mesa-vulkan-broadcom
+ alsa-utils
+ xset
+ xfontsel
+ xrandr
+ iwd
+ python3-devel
+ python3-RPi.GPIO
+ socklog-void
+ rust
+ cargo
+ rpi-userland
+ rpi-userland-devel

## Services

+ acpid
+ chronyd
+ dbus
+ dhcpcd
+ iwd
+ nanoklogd
+ ntpd
+ seatd
+ socklog-unix
+ sshd
+ udevd
+ uuidd

## QoL Packages

+ pfetch
+ onefetch
+ unclutter
+ qutebrowser
+ tty-clock
+ cmatrix
+ tty-clock
+ evtest
+ ppsspp
+ xboxdrv
+ retroarch
+ AlsaMixer.app
+ gkill

## Installation Notes

### System Services

Note to self:

+ with no systemd in void and using runit, enable services with symlinks

`ln -s /etc/ev/service_name /var/service`

### Changing system time

Since EST is such a pain in the ass to config, I'll list the exact timezone here

`ln -sf /usr/share/zoneinfo/EST5EDT /etc/localtime`

### Changing live image size

+ Get the live image flashed on an sd card

+ Plug the sd card into a card reader

+ Use fdisk -l to confirm the sd card is detected

	+ The default partitioning scheme should be around 64mb for /boot, and 1.9GB for /

+ use dd to copy the contents of / to a new image file

	+ `dd if=<source_disk_partition> of=~/name.img`

+ repartition the / partition with fdisk

	+ Fill the empty space with the / partition

	+ Make sure to comfirm to write to partition table after

+ dd the image back into the new partition

 	+ `dd if=~/name.img of=<source_disk_partition>`

+ check with `fdisk -l`

+ resize the filesystem to match the new size with resize2fs

### Audio

Remember to add user to audio group to access audio with alsa

### xboxdrv

Tried to get ppsspp to work with built in controller but ended in failure.

+ Tried to install sdl2 and sdl2-devel, and I have already installed the sdl equivalent beforehand

+ evtest does show controller input, so the controller is detected on events and input devices

+ Currently using xboxdrv to emulate keyboard input

** Turns out I'm stupid and didn't add my user to `input` group! **

### Safe Shutdown

This involves tweaking the files from the python script provided in the repository and adding an entry to rc.local.

+ The safeshutdown.py script will be in the repository

+ My rc.local file will also be in the repository

+ Instead of getting the RPi.GPIO module from pip, get it from package manager instead, since it has to be system-wide and runnable from root

### Booting directly into i3

Encountered a variety of problems, but also learned a lot in the process.

! rc.local runs in stage 2 and therefore before services are started

+ There's no systemd in void, therefore I had to deal with elogind, which was a pain.

	+ elogind was supposed to set XDG environment, so I could detect the tty I'm booting in, but that turns out to not be required

	+ also learned that killall doesn't exist in void. I was going to write a script to kill elogind as root after it sets the environment, since it keeps on reinitializing and fills the tty.

There are 3 files that need to be dealt with, which are `agetty-tty1/conf`, `~/.bash_profile` and `.xinitrc`, and I'll include them all here.

It's funny to think that this was what the case was meant to be used for, but how much of a pain it was to get this to work on top of void and to suit my needs/vision, but I'm glad that it's done.

### Opengl async flip problem

Encountered an I/O problem that caused me to not be able to sudo into poweroff.

	+ After checking with `dmesg` and `svlogtail`, it seems that the main problem would be due that the kern.err `async flips are not allowed` originating from vc4 driver flooding output.
	
	+ since I start ppsspp on boot, the error had something to do with ppsspp. This was confirmed by exiting and relaunch ppsspp after boot, where the same messages start popping up again.
	
	+ since after some research this seems to have something to do with X and video drivers, I've installed additional mesa drivers and also the mesa driver for vulkan
	
	+ after switching the ppsspp backend to vulkan, the kern.err has stopped.

### To Do

+ bluetooth (probably with bluetoothd and bluetoothctl)

+ rust lang

	+ and other langs I'm planning to use, toolkits blah blah

+ my own script so I could run scripts with built-in controller

	+ if I have a ton of free time

	+ this is possible since modules and drivers could be ran on boot, therefore it is possible to set up xboxdrv with a config for menu selection, then depending on the scenario rmmod and modprobe xpad later.

	+ it shouldn't be too hard to write my own startup script that runs somewhere in stage two with rc.local (or in rc.local)

+ some way to cut off the annoying sleep functionality button

	+ it does nothing besides turning off the screen every 20 minutes and fucking up your day, plus mess up your screen offset

	+ might have to deal with rpi gpio, though that is not a guaranteed fix and depends on the pcb and how the buttons are configurated on the hat
