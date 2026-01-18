#!/bin/bash

# Get current workspace
CURRENT_WS=$(niri msg workspaces | grep -E '\*' | awk '{print $2}' | tr -d '\n')

# Get total number of workspaces by counting all numeric lines
TOTAL_WS=$(niri msg workspaces | grep -E '[0-9]+' | wc -l)

# Define workspaces dynamically based on niri's workspaces
TOTAL_WS=$((TOTAL_WS - 1))
# Limit to maximum 4 workspaces
if [ "$TOTAL_WS" -gt 4 ]; then
    TOTAL_WS=4
fi

for i in $(seq 1 $TOTAL_WS); do
    if [ "$i" -eq "$CURRENT_WS" ]; then
        # Active workspace - completely white with modern icon
        echo -n "<span color='white'>󰮯 $i</span> "
    else
        # Inactive workspace - brighter gray with modern icon
        echo -n "<span color='#bbbbbb'>󰮮 $i</span> "
    fi
done