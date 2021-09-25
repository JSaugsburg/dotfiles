#!/usr/bin/bash

while true; do
	ouput=$(playerctl --player=firefox,spotifyd metadata --format "{{ title }} - {{ artist }}" --follow)
	export test=$output
done
