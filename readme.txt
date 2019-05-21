omxpocket

about
omxpocket is a wrapper for omxplayer which automagically scales 
 down a video toward the bottom-right hand corner of your monitor.  
 this program takes all the guesswork of having to calculate 
 the correct proportions when scaling a video down from fullscreen.
 that way, you can watch a movie and work at the same time!   

dependancies
omxplayer is required since its program being wrapped. 
xdpyinfo is also required but should already be an available resource.
exiftool is also required for the purposes of collecting video
 dimension info so that you don't need to enter these in manually.
 
how to use
assuming you have the following dependancies installed, go ahead and 
 download or clone this program to any local folder.
once downloaded, navigate to where 'omxpocket.sh' is located and execute: 
 `chmod +x *.sh`
create a bash alias for this program or add to $PATH, that way you 
 need only execute 'omxpocket' when in your video folder.
lastly, navigate to your video file (mp4 or mkv at this time) and 
 simply execute 'omxpocket'. do not add the movie file extensions!
 the program already looks for that.

further help
find me on github if there are any questions.
github.com/rixwoodling

enjoy!

Rix
