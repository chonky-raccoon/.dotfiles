#!/bin/sh

n=$(checkupdates | awk '{print $1}' | wc -l)

if [[ "$n" -eq 0 ]]; then
    text=""
elif [[ "$n" -eq 1 ]]; then 
    text="󰇚 1 update"
else 
    text="󰇚 $n updates"
fi

echo {\"text\": \"$text\", \"alt\": \"$n\", \"tooltip\": \"$text\", \"class\": \"custom-updates\"}
