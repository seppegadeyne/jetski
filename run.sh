#!/bin/bash

MINER_EXECUTABLE="$HOME/jetski/qli-Client"
SESSION_NAME="qubic"

# Check if the screen session is already running, if so, stop it first
if screen -list | grep -q "$SESSION_NAME"; then
	echo "Screen session '$SESSION_NAME' is already running, stopping it now..."
	screen -S "$SESSION_NAME" -X quit
	sleep 2  # Give it some time to close
fi

screen -dmS "$SESSION_NAME" "$MINER_EXECUTABLE"

echo "Jetski started in screen session '$SESSION_NAME'."
echo "You can attach to the session using 'screen -r $SESSION_NAME'."
echo "To detach from the session, press 'Ctrl+A' followed by 'D'."
echo "To stop the session, press 'Ctrl+C' and then 'Ctrl+D'."
echo "To list all running screen sessions, use 'screen -list'."
