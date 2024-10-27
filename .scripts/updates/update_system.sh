#!/bin/bash

echo "󰑓 Checking for updates..."

updates=$(yay -Qu | grep -v '^S')

if [[ -z "$updates" ]]; then
    echo -e "\n No pending updates found. System up to date."
    echo -e "\n󱎫 Closing in 3s"
    sleep 1
    echo "󱎫 Closing in 2s"
    sleep 1
    echo "󱎫 Closing in 1s"
    sleep 1
    exit 0
fi

echo -e "\n󰚰 Available updates: "
while IFS= read -r line; do
   echo -e "\t $line"
done <<< "$updates"

# Prompt the user for a yes/no question
echo
read -p "  Do you want to proceed with the update? (y/n): " answer

# Convert the answer to lowercase for easier comparison
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
    echo "Proceeding with the update..."
    yay -Syu --noconfirm

    # Clean orphaned packages
    echo "Cleaning orphaned packages..."
    orphans=$(yay -Qdtq)
    if [[ -n "$orphans" ]]; then
        echo "Removing orphaned packages..."
        yay -Rns $orphans --noconfirm
    else
        echo "No orphaned packages to remove."
    fi

    echo "󱝁 System update complete."
    pkill -SIGRTMIN+9 waybar
else
    echo "  Suit yourself bozo! "
fi

echo -e "\n󱎫 Closing in 3s"
sleep 1
echo "󱎫 Closing in 2s"
sleep 1
echo "󱎫 Closing in 1s"
sleep 1

exit 0
