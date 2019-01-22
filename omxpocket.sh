#!/bin/bash

echo Copyleft under a GPL license 2019 by rixwoodling.ninja
echo This program comes with ABSOLUTELY NO WARRANTY by running this.
echo This is free software, and you are welcome to redistribute it
echo on the condition you share it!

# Easily pockets omxplayer in the corner of your monitor!
# needs omxplayer and xdpyinfo

p=25    # percentage setting
m=50    # margin setting
f=mp4   # file type 

w=$(cat *.nfo | grep -e \<width\> | sed -e '/[ </width>]//g') | w=$((w / (100 / p)))
h=$(cat *.nfo | grep -e \<height\> | sed -e 's/[ </height>]//g') | h=$((h / (100/p)))
x=$(xdpyinfo | grep dimensions | sed -e 's/x.*//' -e 's/[^0-9]*//g')
y=$(xdpyinfo | grep dimensions | sed 's/[^x]*.//' | awk '{print $1}')
x1=$((x - w - m))
y1=$((y - h - m))
x2=$((x - m))
y2=$((y - m))
omxplayer -o hmdi --win "$x1,$y1,$w2,$h2" *.$f
done

