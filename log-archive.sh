#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <log-directory> <archive-directory>"
    exit 1
fi

# Variables
LOG_DIR="$1"          # The directory containing logs to archive
ARCHIVE_DIR="$2"      # Directory to store the archived files
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")  # Generate timestamp
ARCHIVE_FILE="logs_archive_$TIMESTAMP.tar.gz"  # Archive filename

# Ensure the source log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory $LOG_DIR does not exist."
    exit 1
fi

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Compress the logs into a .tar.gz file
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" --directory "$LOG_DIR" . 2>/dev/null

# Output for user
echo "Archived logs from $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_FILE"
