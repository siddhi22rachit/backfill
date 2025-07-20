
for day in {1..30}
do
  for commit in {1..4}
  do
   export GIT_AUTHOR_DATE="2025-06-$(printf "%02d" $day)TO$commit:00:00"
   export GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE
   echo "Commit $commit on 2025-06-$(printf "%02d" $day)" >> log.txt
   git add log.txt
   git commit -m "Commit $commit on 2025-06-$(printf "%02d" $day)"
  done
 done

git push origin main
