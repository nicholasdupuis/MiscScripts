for dir in $(ls)                            #For each directory
  do
    cd $dir 2>>/dev/null                    #cd into directory, hide errors
    if [[ -e ./.git ]]                      #If this is a git directory...
      then
        echo "Updating "$dir
        git stash > /dev/null 2>&1          #Stash any changes there might be
        git checkout dev > /dev/null 2>&1   #Go to the dev branch
          if [[ $? -eq 0 ]]                 #If checkout is successful
            then
              git pull -p > /dev/null 2>&1  #Update the dev branch, prune old branches
            else
              git checkout master /dev/null 2>&1
              git pull -p
          fi
    fi
    cd ..
  done
