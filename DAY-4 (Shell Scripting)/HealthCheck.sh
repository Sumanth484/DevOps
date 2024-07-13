bash
#!/bin/bash

# Define threshold and alert command
THRESHOLD=70
ALERT_COMMAND="echo 'Memory usage alert!' | mail -s 'Memory Usage Alert' puvvadasumanthkumar@gmail.com"

# Get memory usage and processor count
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%s/%s (%.2f%%)", $3,$2,$3*100/$2}')
PROCESSORS=$(nproc --all)

# Extract memory usage percentage
MEMORY_PERCENTAGE=$(echo $MEMORY_USAGE | awk '{print $3}')

# Check if memory usage exceeds threshold
if [ $(echo "$MEMORY_PERCENTAGE > $THRESHOLD" | bc -l) -eq 1 ]; then
  # Trigger alert
  $ALERT_COMMAND
fi

# Print status (optional)
echo "Memory Usage: $MEMORY_USAGE"
echo "Processors: $PROCESSORS"