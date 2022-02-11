#!/usr/bin/bash

# Run `pactl list short sinks` for a list of sink names.
# filter out unused sink hdmi -> Lautsprecherboxen; am Schluss noch Whitespace durch * erstezen
# macht den cut Befehl später leichter
sink_ids=$(pactl list short sinks | grep -v "hdmi" | sed -r 's/\s+/*/g')
next_device=$(echo "$sink_ids" | grep -v "RUNNING" | cut -d "*" -f1)
# switch device
pactl set-default-sink $next_device
# ipc event an polybar
polybar-msg hook check-sink 2
