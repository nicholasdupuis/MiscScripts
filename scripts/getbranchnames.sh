#!/usr/bin/env bash

red() { echo "$(tput setaf 1)$*$(tput setaf 7)"; }
green() { echo "$(tput setaf 2)$*$(tput setaf 7)"; }
white() { echo "$(tput setaf 7)$*$(tput setaf 7)"; }

for dir in $(ls)
do
  if [[ -d ./$dir ]]
    then
        cd $dir
        branch_name=$(git symbolic-ref --short -q HEAD)
        #Prints "module_name: branch_name" with the branch name in green.
        echo $(white $dir)": "$(green $branch_name)
        cd ..
    else
        red $dir" is not a directory"
  fi
done
