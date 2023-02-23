#!/usr/bin/bash

# 
# Change to workspace $1, but before that:
#  - Take a screenshot of the current workspace using scrot
#  - Open the screenshot using feh (the window manager must set the window to borderless fullscreen)
#  - Move the feh window $STEP pixels at time trough the X axis, until it's no longer visible
#  - Kill the feh window
#
# Supports passing just "next" or "prev" as argument
#	It ain't much, but it's honest work
#
# @author: Dahan Schuster

# get the target workspace from arguments
WORKSPACE=$1

# get current workspace using i3-msg
CURRENT_WORKSPACE=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

# workspace screenshot name
PRTSRC=".ws-screenshot.jpeg"

# step of the animation
STEP=5

# multiplier for acceleration effect
MULT=8

# Direction of movement for wmctrl
# this is used to multiply the step value,
# changing the behavior of the for loop
RIGHT=1
LEFT=-1

# screen size
WIN_H=1080
WIN_W=1920

# "next" moves to the workspace at right
if [[ "$WORKSPACE" == "next" ]]; then
	WORKSPACE=`expr $CURRENT_WORKSPACE + 1`

	# if we reached to the rightmost workspace, go back to the first one
	[ $WORKSPACE -gt 10 ] && WORKSPACE=1
# "prev" moves to the workspace at left
elif [[ "$WORKSPACE" == "prev" ]]; then
	WORKSPACE=`expr $CURRENT_WORKSPACE - 1`
	
	# if we reached to the leftmost workspace, go back to the last one
	[ $WORKSPACE -lt 1 ] && WORKSPACE=10
fi

# if target workspace is not the current one
if [ $CURRENT_WORKSPACE -ne $WORKSPACE ]; then
	# take a screenshot of the workspace
	scrot -q 100 --overwrite --silent -f "$PRTSRC"
	# open the screenshot with feh in daemon mode
	feh "$PRTSRC" &
	# gets the feh's daemon pid
	FEH_WINDOW=$!
	# give feh time to open
	sleep .1
	# change workspace
	i3-msg workspace $WORKSPACE
	# give the window manager time to change ws
	sleep .1
else
	# if we already are at the workspace, that's no need to move
	exit
fi

# Uses wmctrl to move the feh window in the x axis
# $STEP can be changed for more performance, generating
# less loops
# $MULT can be changed to increase the movement acceleration
slide_feh_window(){
	# expects receiving one of $RIGHT or $LEFT
	DIRECTION=$1

	# gets the id of the feh window that is showing a
	# screenshot of the workspace
	FEH_ID=`wmctrl -l|grep "$PRTSRC"|awk '{print $1}'`

	# multiply the step and window width by the direction
	# this makes the for loop go positive or negative
	_STEP=`expr $STEP \* $DIRECTION`
	_WIN_W=`expr $WIN_W \* $DIRECTION`

	# start loop with 0, incrementing by $_STEP until $_WIN_W
	# if $_STEP is negative (when $DIRECTION is $LEFT), the
	# loop will decrease until $_WIN_W
	for i in $(seq 0 $_STEP $_WIN_W); do
		# multiply the iterator by the acceleration value
		x=$(echo "$i + ($i * $MULT)" | bc)
		# convert float to int (removing fraction numbers)
		x=${x%.*}

		# debug
		# echo "x: $x; i: $i"
		
		# move window with wmctrl by $x pixels
		# negative values moves the window to the left
		wmctrl -i -r $FEH_ID -e 1,$x,0,$WIN_W,$WIN_H
		# don't need to keep going after the window is not
		# visible anymore, so we break the loop
		if (( $x * $DIRECTION >= $WIN_W )); then
			# also kill the feh window
			kill $FEH_WINDOW
			break;
		fi
	done
}

# exit

# changes direction based on which workspace we are now
if [ $CURRENT_WORKSPACE -gt $WORKSPACE ]; then
    slide_feh_window $RIGHT
else
    slide_feh_window $LEFT
fi
