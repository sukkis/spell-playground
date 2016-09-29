#!/bin/bash

# Calculator that describes the result in stars
# Usage: bash laskin.sh 2 + 11
# Adds two and eleven.
#
# Author: Petteri Suckman

TULOS=$(( $1 $2 $3 ))
echo "Tulos on: $TULOS"

function laske_tahdet 
{
  VIIDEN_RYHMIA=$(( $TULOS / 5 ))
  JAKOJAANNOS=$(( $TULOS % 5 ))
 
  echo " "
   
  # Show result in groups of five
  while [ $VIIDEN_RYHMIA -gt 0 ] 
  do
    echo " * * *  * * "
    VIIDEN_RYHMIA=$(( $VIIDEN_RYHMIA - 1 ))

    # Separate stars vertically    
    JAANNOS=$(( $VIIDEN_RYHMIA % 4 ))
    if [ $JAANNOS -eq 0 ]
      then echo " " 
    fi

  done

  while [ $JAKOJAANNOS -gt 0 ]
  do
    echo -n " * "
    JAKOJAANNOS=$(( $JAKOJAANNOS -1 ))
  done

  echo " "
}

laske_tahdet
