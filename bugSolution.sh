#!/bin/bash

# This script demonstrates a solution to the race condition
# using a lock file to ensure mutual exclusion.

counter=0
lock_file="counter.lock"

# Function to increment the counter
increment_counter() {
  # Acquire the lock
  flock -x "$lock_file" || exit 1

  local i
  for i in {1..1000}; do
    let counter+=1
  done

  # Release the lock
  flock -u "$lock_file"
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Print the final counter value
echo "Final counter value: $counter"
rm -f "$lock_file"