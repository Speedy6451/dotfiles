#!/bin/bash
 
# based on https://gist.github.com/singulared/7c6d53c1b84fbb7cf22d07c5c7d3e945?permalink_comment_id=3179677#gistcomment-3179677

swayidle \
    timeout 14 'swaymsg "output * dpms off" ; ssh sp3 DISPLAY=:0 xset dpms force off' \
    resume 'swaymsg "output * dpms on" ; ssh sp3 "export DISPLAY=:0 && xset dpms 0 0 0 && xset -dpms  && xset s off && xset s noblank"' &
 
IMAGE=/tmp/i3lock.png
LOCK=~/stow/bin/assets/stop.png
LOCKARGS=" --ring-color 1108ee08 \
	--inside-color 1108ee02 \
	--indicator-x-position 1343 \
	--indicator-y-position 680 \
	--indicator-radius 220 \
	--indicator-thickness 20 \
	--ring-clear-color 1100ff10 \
	--inside-clear-color 1f41ff70 \
	--ring-wrong-color ff000010 \
	--inside-clear-color ff212f70 \
	--key-hl-color 1111f160 "

for OUTPUT in `swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name'`
do
    IMAGE=/tmp/$OUTPUT-lock.png
    grim -o $OUTPUT $IMAGE
    corrupter -mag 1.2 -boffset 7  -meanabber 2 $IMAGE $IMAGE
    #composite -gravity center $LOCK $IMAGE $IMAGE
    LOCKARGS="${LOCKARGS} --image ${OUTPUT}:${IMAGE}"
    IMAGES="${IMAGES} ${IMAGE}"
done
swaylock $LOCKARGS
rm $IMAGES

kill %%
