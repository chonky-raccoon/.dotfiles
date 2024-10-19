#!/bin/bash

# Use zenity to open a file chooser dialog and get the selected file
selected_file=$(zenity --file-selection --title="Select an Image" --filename="$HOME/Pictures/wallpapers/wallpaper.jpg")

# Check if the user canceled the dialog
if [ -z "$selected_file" ]; then
    echo "No file selected. Exiting."
    exit 1
fi

./set_wallpaper.sh "$selected_file"
