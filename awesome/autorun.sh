#!/bin/bash

XRANDR_OUTPUT="$(xrandr)";

echo "$XRANDR_OUTPUT";
# configure order of monitors on home ubuntu PC
if [[ $XRANDR_OUTPUT == *"DP-0 connected"* ]] && [[ $XRANDR_OUTPUT == *"HDMI-1 connected"* ]] ; then
  xrandr --auto --output HDMI-1 --mode 1920x1080;
  xrandr --auto --output DP-0 --mode 1920x1080 --left-of HDMI-1;
fi
