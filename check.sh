#!/bin/bash

BASEDIR="$HOME/jetski"
SESSION_NAME="qubic"
PROCESS_PATH="$HOME/jetski/qli-Client"

# Check if the base directory exists, otherwise exit
if [ ! -d "$BASEDIR" ]; then
	logger -t check-jetski "Error: Directory '$BASEDIR' does not exist. Exiting."
	exit 1
fi

# Check if the actual jetski process is running (exact match)
PROCESS_PID=$(ps aux | awk '$11 == "'$PROCESS_PATH'" {print $2}')

if [ -n "$PROCESS_PID" ]; then
	logger -t check-jetski "Process '$PROCESS_PATH' is already running (PID: $PROCESS_PID). No action needed."
	exit 0
fi

logger -t check-jetski "Process '$PROCESS_PATH' is not running. Restarting..."

# Call run.sh to restart the application
cd "$BASEDIR" && ./run.sh 

logger -t check-jetski "jetski process restarted successfully."