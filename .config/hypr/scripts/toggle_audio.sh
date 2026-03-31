#!/usr/bin/env bash

# --- CONFIGURATION ---
# Use the EXACT node names you found earlier
SINK_1="alsa_output.pci-0000_00_1f.3.analog-stereo"
SINK_2="alsa_output.usb-SteelSeries_Arctis_Nova_7-00.analog-stereo"

# --- LOGIC ---
# Get the current default sink name directly
CURRENT_SINK=$(pactl get-default-sink)

if [ "$CURRENT_SINK" = "$SINK_1" ]; then
    pactl set-default-sink "$SINK_2"
    notify-send "Audio" "Switched to Headset" -i audio-headphones
else
    pactl set-default-sink "$SINK_1"
    notify-send "Audio" "Switched to Speakers" -i audio-speakers
fi
