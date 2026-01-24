URL="https://api.open-meteo.com/v1/forecast?latitude=23.7104&longitude=90.4074&current=temperature_2m,weathercode&timezone=auto"

# Get current data
current=$(curl -s "$URL")
temp=$(echo "$current" | jq -r '.current.temperature_2m')
weathercode=$(echo "$current" | jq -r '.current.weathercode')

# Get current hour to determine day/night
hour=$(date +%H)

# Determine weather icon based on weather code and time
get_weather_icon() {
    local code=$1
    local is_day=$2
    
    case $code in
        0) # Clear sky
            if [ "$is_day" = "true" ]; then echo "󰖙"; else echo "󰖔"; fi ;;
        1|2|3) # Mainly clear, partly cloudy, overcast
            if [ "$is_day" = "true" ]; then echo "󰖕"; else echo "󰼱"; fi ;;
        45|48) # Fog, depositing rime fog
            echo "󰖑" ;;
        51|53|55|56|57) # Drizzle
            echo "󰖗" ;;
        61|63|65|66|67) # Rain
            echo "󰖖" ;;
        71|73|75|77) # Snow fall
            echo "󰖘" ;;
        80|81|82) # Rain showers
            echo "󰖖" ;;
        85|86) # Snow showers
            echo "󰖘" ;;
        95|96|99) # Thunderstorm
            echo "󰖓" ;;
        *) # Default
            if [ "$is_day" = "true" ]; then echo "󰖙"; else echo "󰖔"; fi ;;
    esac
}

# Determine if it's day time (6:00 - 18:00)
is_day="false"
if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
    is_day="true"
fi

icon=$(get_weather_icon "$weathercode" "$is_day")
echo "${icon} ${temp}°C"
