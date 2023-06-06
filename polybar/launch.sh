#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
killall polybar

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar-home.log
#polybar home 2>&1 | tee -a /tmp/polybar-home.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload home &
  done
else
  polybar --reload home &
fi

echo "Polybar launched..."
