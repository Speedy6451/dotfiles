#!/bin/zsh

swayidle \
    timeout 7 'swaymsg "output * dpms off" ; ssh sp3 DISPLAY=:0 xset dpms force off' \
    resume 'swaymsg "output * dpms on" ; ssh sp3 "export DISPLAY=:0 && xset dpms 0 0 0 && xset -dpms  && xset s off && xset s noblank"' &

swaylock -c 000000 \
	-i /home/andy/Documents/media/wallpapers/kestrel5.jpg -l \
	--ring-color 1108ee08 \
	--inside-color 1108ee02 \
	--indicator-x-position 1343 \
	--indicator-y-position 680 \
	--indicator-radius 220 \
	--indicator-thickness 20 \
	--ring-clear-color 1100ff10 \
	--inside-clear-color 1f41ff70 \
	--ring-wrong-color ff000010 \
	--inside-clear-color ff212f70 \
	--key-hl-color 1111f160

kill %%
