#! /bin/bash

Current=$(xrandr --verbose | grep Gamma | awk '{print $2}' | head -1)

                  # ⬇ dunno why this value works
if [ "$Current" == "1.0:1.0:1.1" ]; then
    xrandr --output $1 --gamma 1.0:0.88:0.76
    xrandr --output $2 --gamma 1.0:0.88:0.76
else
    xrandr --output $1 --gamma 1.0:1.0:0.9
    xrandr --output $2 --gamma 1.0:1.0:0.9
fi
