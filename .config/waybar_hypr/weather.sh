URL="https://api.open-meteo.com/v1/forecast?latitude=23.7104&longitude=90.4074&hourly=temperature_2m&timezone=auto"
weather=$(curl -s "$URL" | jq '.hourly.temperature_2m[0] | round')
echo "$weather°C"
