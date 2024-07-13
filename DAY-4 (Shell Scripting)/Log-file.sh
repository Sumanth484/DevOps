#!/bin/bash

# Define the URL of the log file
LOG_FILE_URL=""

# Fetch and search the log file in one step
curl -s $LOG_FILE_URL | grep -c "ERROR"
curl -s $LOG_FILE_URL | grep -c "404"
