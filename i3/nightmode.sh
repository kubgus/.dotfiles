#! /bin/bash

xrandr --output $1 --brightness 0.7
xrandr --output $2 --brightness 0.7
redshift -O 3000
