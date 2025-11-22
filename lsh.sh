source ~/.env
MODEL='gemini-2.5-flash'
PROMPT="$1"

if [ -z "$PROMPT" ]; then
  echo "You didn't provide a prompt" && exit 1
fi

response=$(curl -s "https://generativelanguage.googleapis.com/v1beta/models/$MODEL:generateContent" \
  -H "x-goog-api-key: $GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -d "{
    \"system_instruction\": {
      \"parts\": [
        {
          \"text\": \"Convert the user message into a single Linux shell command. Respond only with the shell command, no quotes around.\"
        }
      ]
    },
    \"contents\": [
      {
        \"parts\": [
          {
            \"text\": \"$PROMPT\"
          }
        ]
      }
    ]
  }")

command=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')
echo "$command"

