#!/bin/bash

# Start date: 2024-06-01
start_date="2024-06-01"
# End date: 2025-05-31
end_date="2025-05-31"

current_date="$start_date"

while [ "$current_date" != "$(date -I -d "$end_date + 1 day")" ]
do
  # Random commits for the day (0 to 7)
  commit_count=$((RANDOM % 8))

  for ((i = 1; i <= commit_count; i++))
  do
    # Random hour and minute
    hour=$((RANDOM % 24))
    min=$((RANDOM % 60))

    # Format time
    time=$(printf "%02d:%02d:00" $hour $min)

    export GIT_AUTHOR_DATE="$current_date"T$time
    export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"

    echo "Commit $i on $current_date at $time" >> log.txt
    git add log.txt
    git commit -m "Commit $i on $current_date at $time"
  done

  # Next day
  current_date=$(date -I -d "$current_date + 1 day")
done

git push origin main
