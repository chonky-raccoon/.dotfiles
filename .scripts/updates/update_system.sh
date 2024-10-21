#!/bin/bash

echo "Pending updates: "
echo "-----------------"
yay -Qu
echo "-----------------"

# Prompt the user for a yes/no question
read -p "Do you want to proceed with the update? (y/n): " answer

# Convert the answer to lowercase for easier comparison
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
    echo "Proceeding with the update..."
    yay -Syu --devel --noconfirm

    # Clean orphaned packages
    echo "Cleaning orphaned packages..."
    orphans=$(yay -Qdtq)
    if [[ -n "$orphans" ]]; then
        echo "Removing orphaned packages..."
        yay -Rns $orphans --noconfirm
    else
        echo "No orphaned packages to remove."
    fi

    echo "System update complete."
    pkill -SIGRTMIN+9 waybar
else
    echo "Suit yourself bozo!"
fi
