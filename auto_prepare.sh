#!/bin/sh
sudo su -c "yes | add-apt-repository ppa:kirillshkrogalev/ffmpeg-next"
sudo apt-get update && sudo apt-get install ffmpeg libav-tools -y
