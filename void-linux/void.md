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

+ xrandr

+ xset

+ xfontsel

+ alsa-utils

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

## Installation Notes

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
