#!/bin/bash

# Get current workspace for Hyprland
CURRENT_WS=$(hyprctl activeworkspace -j | jq '.id')

# Show only 4 workspaces
for i in 1 2 3; do
    if [ "$i" -eq "$CURRENT_WS" ]; then
        # Active workspace - completely white with modern icon
        echo -n "<span color='white'>󰮯 $i</span> "
    else
        # Inactive workspace - brighter gray with modern icon
        echo -n "<span color='#bbbbbb'>󰮮 $i</span> "
    fi
done

# Fourth workspace - shows current number if > 3
if [ "$CURRENT_WS" -gt 3 ]; then
    echo -n "<span color='white'>󰮯 $CURRENT_WS</span> "
else
    echo -n "<span color='#bbbbbb'>󰮮 4</span> "
fi
