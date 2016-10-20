#!/bin/bash
# This script changes name of files, adding a date to the file name
# Usage:  
#  1. Change the directory  "PIC_DIR"
#  2. Change picture name pattern in  "PICTURES" accordingly
#  3. If needed, change target name in the mv command
# - You can also use command line parameters to give the directory and pattern, 
#   like this: "sh rename_pic.sh /home/myname/Pictures Select*png"
# Author: Petteri Suckman

# Set picture directory
if [ -z $1 ]
  then PIC_DIR="/home/petterisu/Pictures"
  else PIC_DIR=$1
fi

cd $PIC_DIR

# Set picture name pattern
if [ -z $2 ]
  then PATTERN="Select*png"
  else PATTERN=$2
fi 

PICTURES=$(ls $PATTERN)
echo picture directory is: $PIC_DIR
echo picture selection is: $PICTURES

DATE=$(date | awk -F " " '{ print substr($2,7,4)"-"substr($2,4,2)"-"substr($2,0,2)}')

# Change name of each file matching the pattern
for PIC in $PICTURES; do
  PIC_ED=$(echo $PIC | egrep -o 'Selection_[0-9]{3}')
  echo changing $PIC to ${PIC_ED}_${DATE}.png
  mv $PIC ${PIC_ED}_${DATE}.png
done
