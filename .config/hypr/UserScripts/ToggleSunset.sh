#!/bin/bash

# Define the location for wlsunset
WLSUNSET_CMD="wlsunset -l 33.1 -L -97.2"

# Check if wlsunset is running
if pgrep -x "wlsunset" > /dev/null; then
    # If wlsunset is running, kill it and start hyprsunset
    pkill wlsunset
    hyprsunset --temperature 2500 &

    # Send notification about hyprsunset activation
    notify-send "Bluelight Filter" "Enabled" --icon=weather-clear --urgency=low
else
    # If wlsunset is not running, kill hyprsunset and start wlsunset with your location
    pkill hyprsunset
    $WLSUNSET_CMD &

    # Send notification about wlsunset activation
    notify-send "Switched to wlsunset" "Location: 33.1, -97.2" --icon=weather-sunset --urgency=low
fi
