#!/bin/bash

# Define a helper function to send notifications with no title
notify() {
    notify-send "$1"
}

# Check if tailscale is running
if pgrep -x "tailscaled" > /dev/null; then
    echo "Stopping Tailscale..."
    sudo tailscale down
    sudo systemctl stop tailscaled
    notify "Tailscale disabled"
else
    echo "Starting Tailscale..."
    sudo systemctl start tailscaled
    sleep 2

    echo "Bringing Tailscale up..."
    sudo tailscale up

    echo "Setting exit node to 'nexus'..."
    sudo tailscale set --exit-node nexus

    notify-send "Tailscale enabled" "(Exit Node: nexus)"
fi
