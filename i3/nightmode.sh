#! /bin/bash

Current=$(xrandr --verbose | grep Gamma | awk '{print $2}' | head -1)

if [ "$Current" == "1.0:1.0:1.0" ]; then
    xrandr --output $1 --gamma 1.0:0.88:0.76
    xrandr --output $2 --gamma 1.0:0.88:0.76
else
    xrandr --output $1 --gamma 1.0:1.0:1.0
    xrandr --output $2 --gamma 1.0:1.0:1.0
fi
