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

new_wall=$(realpath "$1")
symlink=~/Pictures/wallpapers/wallpaper.jpg

rm $symlink

ln -s "$new_wall" $symlink

killall swaybg > /dev/null 2>&1

nohup swaybg -i $symlink -m fill > /dev/null 2>&1 & 

echo "Wallpaper changed to $new_wall"
