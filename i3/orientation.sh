#!/bin/bash

# Get the current screen orientation
current_orientation=$(xrandr --verbose | grep -m 1 ' connected' | grep -o 'normal\|inverted\|left\|right' | head -1)

# Check if the current orientation is normal or inverted
if [ "$current_orientation" == "normal" ]; then
    # Switch to inverted orientation (xrandr -o 3)
    xrandr -o 3
elif [ "$current_orientation" == "right" ]; then
    # Switch to normal orientation (xrandr -o 0)
    xrandr -o 0
else
    # If it's not normal or inverted, default to normal orientation
    xrandr -o 0
fi

sh ${HOME}/.config/i3/rotate_touchpad.sh
