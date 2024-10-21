#!/bin/bash

echo "Checking for updates..."

updates=$(yay -Qu --devel | grep -v '^S')

if [[ -z "$n" ]]; then
    echo 
    echo "System is up to date."
    echo
    echo "Closing in 2s"
    sleep 1
    echo "Closing in 1s"
    sleep 1
    exit 0;
fi

echo "Pending updates: "
echo "-----------------"
echo "$updates"
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
