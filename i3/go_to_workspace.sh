#!/usr/bin/bash

# get the target workspace from arguments
WORKSPACE=$1

# get current workspace
WKSP=`xprop -root -notype  _NET_CURRENT_DESKTOP | sed 's#.* =##'`
CURRENT_WORKSPACE=`expr 1 + $WKSP`

# workspace screenshot name
PRTSRC=".ws-screenshot.jpeg"

# step of the animation
STEP=20

# screen size
WIN_H=1080
WIN_W=1920

# if target workspace is not the current one
if [ $CURRENT_WORKSPACE -ne $WORKSPACE ]; then
	# take a screenshot of the workspace
	scrot -q 100 --overwrite --silent -f "$PRTSRC"
	# open the screenshot with feh
	feh "$PRTSRC" &
	# gets the feh pid
	FEH_WINDOW=$!
	# tell i3 to actually change workspace
	i3-msg workspace $WORKSPACE
	# give i3 time to switch workspace in the background
	sleep .2
else
	exit
fi

slide_FEH_LEFT(){
	FEH_ID=`wmctrl -l|grep "$PRTSRC"|awk '{print $1}'`
	for (( c=0; c>=$WIN_W*-1; c=c-$STEP )) do
		wmctrl -i -r $FEH_ID -e 1,$c,0,$WIN_W,$WIN_H
	done
}

slide_FEH_RIGHT(){
	FEH_ID=`wmctrl -l|grep "$PRTSRC"|awk '{print $1}'`
	for (( c=0; c<=$WIN_W; c=c+$STEP )) do
		wmctrl -i -r $FEH_ID -e 1,$c,0,$WIN_W,$WIN_H
	done
}

if [ $CURRENT_WORKSPACE -gt $WORKSPACE ]; then
    slide_FEH_RIGHT
else
    slide_FEH_LEFT
fi

#SIMPLE KILL AFTER 500ms
{ sleep .1 && kill $FEH_WINDOW; } &
