#!/bin/bash

TOUCHPAD_IDS=(4 13 10 11)

# Get current screen orientation
ORIENTATION=$(xrandr --verbose | grep -m 1 ' connected' | grep -o 'normal\|inverted\|left\|right' | head -1)

for TOUCHPAD_ID in "${TOUCHPAD_IDS[@]}"
do
    # Adjust touchpad based on the orientation
    case "$ORIENTATION" in
        "normal")
            xinput set-prop $TOUCHPAD_ID "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
            ;;
        "inverted")
            xinput set-prop $TOUCHPAD_ID "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
            ;;
        "left")
            xinput set-prop $TOUCHPAD_ID "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
            ;;
        "right")
            xinput set-prop $TOUCHPAD_ID "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
            ;;
    esac
done
