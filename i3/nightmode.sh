#! /bin/bash

Current=$(xrandr --verbose | grep Brightness | awk '{print $2}' | head -1)

if [ "$Current" == "0.50" ]; then
    xrandr --output $1 --brightness 1 --gamma 1.0:1.0:1.0
    xrandr --output $2 --brightness 1 --gamma 1.0:1.0:1.0
else
    xrandr --output $1 --brightness 0.5 --gamma 1.0:0.88:0.76
    xrandr --output $2 --brightness 0.5 --gamma 1.0:0.88:0.76
fi
