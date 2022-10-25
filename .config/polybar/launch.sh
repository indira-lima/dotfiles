#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-home.log
polybar home 2>&1 | tee -a /tmp/polybar-home.log & disown

echo "Polybar launched..."
