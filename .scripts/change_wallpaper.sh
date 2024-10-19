#!/bin/bash

# Check if an argument (path to the wallpaper) is provided
if [ -z "$1" ]; then
    echo "Usage:"
    echo "    $0 /path/to/wallpaper.jpg"
    echo "    or"
    echo "    wallpaper /path/to/wallpaper.jpg"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

rm ~/.config/hypr/wallpaper.jpg

ln -s "$1" ~/.config/hypr/wallpaper.jpg

killall  swaybg

nohup swaybg -i ~/.config/hypr/wallpaper.jpg -m fill > /dev/null 2>&1 & 

echo "Wallpaper changed to $1"
