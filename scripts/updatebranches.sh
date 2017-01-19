#!/usr/bin/env bash

for dir in $(ls)
  do
    cd $dir 2>>/dev/null
    if [[ -e ./.git ]]
      then
        echo "Updating "$dir
        git stash > /dev/null 2>&1        #Stash any changes there might be
        git checkout dev > /dev/null 2>&1 #Go to the dev branch
        git pull -p > /dev/null 2>&1      #Pull latest, prune old branches
    fi
    cd ..
  done

  # TODO: Maybe store what branch the user was previously on, switch to previous
  # branch and pop changes from the stash.
  #
  # Figure out a better way to do error handling
  #
  # Maybe have an option to rebase the current branch on dev
