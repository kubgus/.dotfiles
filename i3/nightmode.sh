#! /bin/bash

xrandr --output $1 --brightness 0.6
xrandr --output $2 --brightness 0.6
redshift -O 3000
