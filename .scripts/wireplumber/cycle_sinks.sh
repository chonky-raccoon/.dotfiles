#!/bin/sh

# extract the sinks from wpctl status
sinks=$(wpctl status | awk '/ Sinks/{flag=1; next} / Sources:/{flag=0} flag')

# extract the id of the finks
ids=$(echo "$sinks" | awk '{print substr($0, 9, 2)}' | grep -v '^$')

# get the number of sinks
mod=$(echo "$ids" | wc -l)

# get current sink index
current=$(echo "$sinks" | grep -n '^ │  \*' | cut -d: -f1)

# apply mod to current index = next index 0 based indexing
current=$(expr $current % $mod)

# next index + 1 = next index 1 based indexing
current=$(expr $current + 1)

# get sink id of nex index
sink_id=$(echo "$ids" | head -n "$current" | tail -n 1)

# change sink on wireplumber
wpctl set-default $sink_id
