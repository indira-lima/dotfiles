#!/usr/bin/bash

# My digital bonsai, made with 💚 and ☕
#
# @author: Dahan Schuster

CBONSAI_DIR="$HOME/.config/cbonsai"
PROGRESS_FILE="$CBONSAI_DIR/progress"

cbonsai \
	--save $PROGRESS_FILE \
	--load $PROGRESS_FILE \
	--live --infinite \
	--multiplier=15 \
	--wait=120 --time=2 \
	--life=60 \
	--base=1 \
	--leaf="&,@,#,e,n,b,y" \
	--seed 42

