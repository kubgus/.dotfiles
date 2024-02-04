#!/usr/bin/env bash

# terminate already running bar instances
# if all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# otherwise you can use the nuclear option:
killall -q polybar

# launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
