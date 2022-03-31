# this script runs xboxdrv and configures the GPi controls to act like a mouse
# dpad moves mouse
# a is left click
# b is right click
# x is backspace
# y is enter key
# lb is arrow up (useful for terminal)
# rb is arrow down (useful for terminal)
# start is meta
# select is escape

# Hold SEL + DPAD_UP to enable HAT mode for mouse settings to work correctly

sudo rmmod xpad

#MOUSE_UP='REL_Y:-5:20'
#MOUSE_DOWN='REL_Y:5:20'
#MOUSE_LEFT='REL_X:-5:20'
#MOUSE_RIGHT='REL_X:5:20'

sudo xboxdrv \
	--silent \
	--mimic-xpad \
	--dpad-as-button \
	--deadzone 4000 \
	--evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RX=x2,ABS_RY=y2,ABS_Z=lt,ABS_RZ=rt \
    --evdev-keymap BTN_SOUTH=a,BTN_EAST=b,BTN_NORTH=x,BTN_WEST=y,BTN_TL=lb,BTN_TR=rb,BTN_THUMBL=tl,BTN_THUMBR=tr,BTN_MODE=guide,BTN_SELECT=back,BTN_START=start,BTN_TRIGGER_HAPPY3=du,BTN_TRIGGER_HAPPY4=dd,BTN_TRIGGER_HAPPY1=dl,BTN_TRIGGER_HAPPY2=dr \
    --evdev-absmap ABS_X=dpad_x,ABS_Y=dpad_y \
    --evdev-absmap ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y \
	--ui-buttonmap "dl=REL_X:-5:20,dr=REL_X:5:20,du=REL_Y:-5:20,dd=REL_Y:5:20," \
	--ui-buttonmap "a=BTN_LEFT,b=BTN_RIGHT,x=KEY_BACKSPACE,y=KEY_ENTER" \
	--ui-buttonmap "start=KEY_SPACE,back=KEY_ESC,tl=void,tr=void" \
	--ui-buttonmap "rb+dl=KEY_LEFT,rb+dr=KEY_RIGHT,rb+du=KEY_UP,rb+dd=KEY_DOWN" \
	--ui-buttonmap "lb+dl=KEY_H,lb+dr=KEY_L,lb+du=KEY_K,lb+dd=KEY_J" \
	--ui-buttonmap "lb+start=KEY_LEFTMETA,rb+start=KEY_RIGHTMETA" &

