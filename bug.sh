#!/bin/bash

# This script demonstrates a race condition where two processes
# try to update a shared counter simultaneously.

counter=0

# Function to increment the counter
increment_counter() {
  local i
  for i in {1..1000}; do
    # Using let to avoid word splitting and globbing issues
    let counter+=1
  done
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $counter"