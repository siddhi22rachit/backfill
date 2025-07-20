#!/bin/bash

# Months from January to July (2025)
for month in {01..07}
do
  year=2024

  echo "Processing month $month..."

  # Pick 10 random unique days (between 1 and 28 to avoid invalid dates)
  days=($(shuf -i 1-28 -n 10))

  for day in "${days[@]}"
  do
    # Format day with leading zero
    day=$(printf "%02d" $day)

    # Random number of commits for the day (1 to 10)
    commit_count=$(( (RANDOM % 10) + 1 ))

    for ((i = 1; i <= commit_count; i++))
    do
      # Random hour and minute
      hour=$((RANDOM % 24))
      min=$((RANDOM % 60))

      time=$(printf "%02d:%02d:00" $hour $min)
      commit_date="$year-$month-$day"T$time

      export GIT_AUTHOR_DATE="$commit_date"
      export GIT_COMMITTER_DATE="$commit_date"

      echo "Commit $i on $year-$month-$day at $time" >> log.txt
      git add log.txt
      git commit -m "Commit $i on $year-$month-$day at $time"
    done
  done
done

git push origin main
