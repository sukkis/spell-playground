#!/bin/bash

DIRECTORY=/home/user/kb

if [ $1 -z ]
then 
  echo "Pattern not given, listing all KnowledgeBase articles."
  echo "Usage: kb <PATTERN>"
  echo "Example: kb tql"
  ls $DIRECTORY
else
  PATTERN="*$1*"
  echo "KnowledgeBase information found under directory $DIRECTORY, with search pattern $PATTERN" 
  ls ${DIRECTORY}/${PATTERN} | xargs less
fi
