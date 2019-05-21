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

p=25  # set percentage of video to be scaled here
m=50  # offset margin setting (plus or minus to margin)

# assign mp4 or mkv filetype to variable 
if [ -f ./*.mp4 ]; then
  f=mp4
else
  f=mkv
fi

# gather video dimensions and scale down
w=$(exiftool -s3 -ImageWidth *.${f})
w=$((w*p/100))
h=$(exiftool -s3 -ImageHeight *.${f})
h=$((h*p/100))

# gather monitor dimensions
x=$(xdpyinfo | grep dimensions | sed -e 's/x.*//' -e 's/[^0-9]*//g')
y=$(xdpyinfo | grep dimensions | sed 's/[^x]*.//' | awk '{print $1}')

# move scaled video down toward bottom-right of screen
x1=$((x - w - m))
y1=$((y - h - m))
x2=$((x - m))
y2=$((y - m))
# launch omxplayer with coordinets already worked out
omxplayer -o hdmi --win "$x1,$y1,$x2,$y2" *.$f

