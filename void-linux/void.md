# void-linux package list

## Important Packages

+ neovim

+ git

+ htop

+ curl

+ gcc

+ make

+ xorg-minimal

+ xorg-fonts

+ xrdb

+ i3

+ i3status

+ rxvt-unicode

+ dmenu

+ mesa-dri

+ alsa-utils

+ xset

+ xfontsel

+ xrandr

+ AlsaMixer.app

+ elogind

+ iwd

+ python3-devel

+ python3-RPi.GPIO

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

### To Do

+ bluetooth (probably with bluetoothd and bluetoothctl)

+ rust lang

	+ and other langs I'm planning to use, toolkits blah blah

+ my own script so I could run scripts with built-in controller

	+ if I have a ton of free time

+ some way to cut off the annoying sleep functionality button

	+ it does nothing besides turning off the screen every 20 minutes and fucking up your day, plus mess up your screen offset
