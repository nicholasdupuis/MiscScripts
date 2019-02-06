#!/usr/bin/env bash

# When run in a folder containing multiple git repositories,
# this script will checkout the "dev" branch and pull the latest changes.

# cd into a given directory and update dev branch, or master branch depending on the repo
update_repo()
{
    cd $1 2>>/dev/null                               
        if [[ -d .git ]]                             # If this is a git directory...
        then
            git stash > /dev/null 2>&1               # Stash any changes there might be
            git checkout dev > /dev/null 2>&1        # Go to the dev branch
            if [[ $? -eq 0 ]]                        # If checkout is successful
                then
                git pull -p > /dev/null 2>&1         # Update the dev branch, prune old branches
                else
                git checkout master > /dev/null 2>&1
                git pull -p > /dev/null 2>&1
            fi
            echo "$dir updated."
            cd ..
        fi
}

#
# Loop through the modules directory, spawning a new thread for each update, and wait
# for all child processes to complete before finishing.
# 
echo "Updating repositories..."
for dir in $(ls)
  do
    update_repo $dir &
  done
  wait
