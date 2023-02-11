#!/usr/bin/bash

CBONSAI_DIR="$HOME/.config/cbonsai"
PROGRESS_FILE="$CBONSAI_DIR/progress"

cbonsai --save $PROGRESS_FILE --load $PROGRESS_FILE --live --infinite --multiplier=15 --wait=2 --time=1 --life=100 --base=1 --leaf="&,@,#,e,n,b,y"

