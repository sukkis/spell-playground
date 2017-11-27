#!/bin/bash
# Saves xmonad.hs version to git development branch
# works only if branch is master and in clean state, otherwise prints an error

# Global variables
CURRENT_DIR=$(pwd)
SAVE_TO_BRANCH="xmonad-development"
XMONAD_DIR="/home/user/git/playground/xmonad"
XMONAD_CONFIG="/home/user/.xmonad/xmonad.hs"
XMOBAR_CONFIG="/home/user/.xmobarrc"
XMONAD_FILE="xmonad.hs"
XMOBAR_FILE=".xmobarrc"

current_branch () {
  cd $XMONAD_DIR
  CURRENT_BRANCH=$( git status | grep "On branch" |cut -d " " -f 3 | tr -d '[:space:]')
  cd $CURRENT_DIR
  echo $CURRENT_BRANCH
}

is_branch_clean () {
  cd $XMONAD_DIR
  BRANCH_STATUS=$(git status | grep "working tree clean" | cut -d " " -f 6)
  cd $CURRENT_DIR

  if [ "clean" = $BRANCH_STATUS ]; then
    echo "true"
  else
    echo "false"
  fi  
}

check_and_push_changes () {
  if [ $( is_branch_clean | tr -d '[:space:]' ) = "true" ] && [ $( current_branch | tr -d '[:space:]' ) = "master" ]
  then  echo "Fills criteria for copying"
    cd $XMONAD_DIR
    git pull
    git checkout $SAVE_TO_BRANCH
    echo checking out $SAVE_TO_BRANCH
    git add $XMONAD_FILE
    echo adding $XMONAD_FILE
    git add $XMOBAR_FILE
    echo adding $XMOBAR_FILE
    git commit -m " Yet another automatic save. $(date)"
    echo committing changes
    git push origin $SAVE_TO_BRANCH
    echo pushing to $SAVE_TO_BRANCH
    git checkout master
    echo changing back to branch master
    echo "DONE. Files saved to branch $SAVE_TO_BRANCH for safekeeping."
    echo "Remember to merge to master as well, when time allows:)"
  else
    echo "Does not fill preconditions. Quitting. "
    cd $XMONAD_DIR
    git status
  fi
}

copy_xmonad_files () {
  cd $XMONAD_DIR
  if [ current_branch = $SAVE_TO_BRANCH ]; then
    cp $XMONAD_CONFIG .
    cp $XMOBAR_CONFIG .
  else
    echo "Incorrect branch"
  fi
}

check_and_push_changes
