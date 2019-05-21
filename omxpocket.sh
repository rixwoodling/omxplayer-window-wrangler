#!/bin/bash

echo Copyleft under a GPL license 2019 by rixwoodling.ninja
echo This program comes with ABSOLUTELY NO WARRANTY by running this.
echo This is free software, and you are welcome to redistribute it
echo on the condition you share it!
echo ...

# about
# omxpocket is a wrapper for omxplayer which automagically scales 
# down a video toward the bottom-right hand corner of your monitor.  

# dependancies
# omxplayer (required), xdpyinfo (required), and exiftool (optional)

p=25    # set percentage of video to be scaled here
m=50    # offset margin setting (plus or minus to margin)
f=mp4   # file type 

# gather video dimensions and scale down
w0=$(exiftool -s3 -ImageWidth *.${f}) | w=$((w0 / (100/p)))
echo $w
h0=$(exiftool -s3 -ImageHeight *.${f}) | h=$((h0 / (100/p)))
echo $h
# gather monitor dimensions
x=$(xdpyinfo | grep dimensions | sed -e 's/x.*//' -e 's/[^0-9]*//g')
echo $x
y=$(xdpyinfo | grep dimensions | sed 's/[^x]*.//' | awk '{print $1}')
echo $y
# move scaled video down toward bottom-right of screen
x1=$((x - w - m))
echo $x1
y1=$((y - h - m))
echo $y1
x2=$((x - m))
echo $x2
y2=$((y - m))
echo $y2
# launch omxplayer with coordinets already worked out
omxplayer -o hdmi --win "$x1,$y1,$x2,$y2" *.$f

