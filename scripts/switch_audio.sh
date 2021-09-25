#!/usr/bin/bash

# Run `pw-play --list-targets` for a list of sink names.
# filter out unused sink GP104
sink_ids=$(pw-play --list-targets | sed '1d' | grep -v "GP104\|ALC892" | tr "*" " " | sed -r 's/\s+//g' | cut -d ":" -f1)
# get current state
for id in $sink_ids; do
	state=$(pw-dump | jq --argjson id $id '.[] | select(.id == $id) | .info.state')
	if [[ $state == \"running\" ]];
       		then current_device=$id;
	fi
	if [[ $state != \"running\" ]];
       		then next_device=$id;
	fi
done

# switch device
pactl set-default-sink $next_device

sleep 1
echo hook:module/check-sink2 >> /tmp/polybar_mqueue.*
