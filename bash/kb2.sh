#!/bin/bash

DIRECTORY=/path/to/where/i/have/my/kb/files

if [ -n $1 ]
  then 
    PATTERN="*$1*"
    echo "KnowledgeBase information found under directory $DIRECTORY, with search pattern $PATTERN" 
    ls ${DIRECTORY}/${PATTERN} | xargs less
  else
    echo "Pattern not given, listing all KnowledgeBase articles."
    echo "Usage: kb <PATTERN>"
    echo "Example: kb tql"
    ls $DIRECTORY
fi
