#! /bin/bash

#INRES="1360x768"
#OUTRES="1360x768"

INRES="1024*576"
OUTRES="1024*576"
FPS="30" # fps
QUAL="slow"

STREAM_KEY=$(cat ./twitch_key.txt)

avconv \
    -f x11grab -s $INRES -r "$FPS" -i :0.0 \
    -f alsa -ac 2 -i pulse \
    -vcodec libx264 -s $OUTRES -preset $QUAL \
    -acodec libmp3lame -ar 44100 -threads 4 -qscale 8 -b 712000 -bufsize 8192k -minrate 5120k -maxrate 8192k -ac 2 \
    -f flv "rtmp://live.justin.tv/app/$STREAM_KEY"
