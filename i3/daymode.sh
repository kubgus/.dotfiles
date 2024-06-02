#! /bin/bash

xrandr --output $1 --brightness 1
xrandr --output $2 --brightness 1
redshift -O 6500
