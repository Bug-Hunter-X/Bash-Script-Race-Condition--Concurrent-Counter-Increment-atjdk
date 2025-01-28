# Bash Script Race Condition

This repository demonstrates a race condition in a bash script where two processes concurrently increment a shared counter.  The final counter value is not guaranteed to be 2000 due to the lack of proper synchronization mechanisms.

## Bug Description
The `bug.sh` script uses two background processes to increment a counter. Because of the race condition, the final counter value is often less than 2000. The solution uses a lock file to ensure only one process modifies the counter at a time. 

## How to Reproduce
1. Clone this repository.
2. Run `./bug.sh` several times. Observe that the final counter value is inconsistent and usually less than 2000.
3. Run `./bugSolution.sh` several times. The final counter value will always be 2000.
