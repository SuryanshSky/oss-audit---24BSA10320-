#!/bin/bash
# Script 4: Log File Analyzer

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found"
    exit 1
fi

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times"

# Show last 5 matches
grep -i "$KEYWORD" "$LOGFILE" | tail -5

# Retry if empty file
if [ ! -s "$LOGFILE" ]; then
    echo "File is empty. Try again later."
fi
