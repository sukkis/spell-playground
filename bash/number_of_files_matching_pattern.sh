#!/bin/bash

# This script counts files by type per day.
# Author: Petteri Suckman

echo "Utility to calculate number of incoming files per day."
echo "Usage: ./scripts/number_of_files_matching_pattern.sh <pattern_to_search> <time_range_in_days> <directory>"
echo "E.g. './scripts/number_of_files_matching_pattern.sh zblinventory 10 /opt/apps/processor-somecustomer/shared/data/original/'"
echo "*****************************************"

if [ -z $1 ];
  then MYPATTERN="zblinventory";
  else MYPATTERN=$1;
fi

echo "Pattern: $MYPATTERN";

# Get number of days from command line
if [ -z $2 ];
  then NUM_DAYS=5;
  else NUM_DAYS=$2;
fi

echo "Time range in days: $NUM_DAYS";

# Getting directory from command line parameter, or using default
if [ -z $3 ];
  then MYDIR="/opt/apps/processor-somecustomer/shared/data/original/";
  else MYDIR=$3;
fi

echo "Directory: $MYDIR";
echo "*****************************************"


cd $MYDIR

START_DATE=`date '+%Y%m%d' -d "-${NUM_DAYS} days"`
for i in `seq 1 $NUM_DAYS`
do
  DATE=`date '+%Y%m%d' -d "${START_DATE}+${i} days"`

  echo "*****************"
  NEW_PATTERN="${MYPATTERN}*${DATE}*"
  PAT_XML="${MYPATTERN}*${DATE}*xml"
  PAT_BZ2="${MYPATTERN}*${DATE}*bz2"
  PAT_CSV="${MYPATTERN}*${DATE}*csv"
  ALL_FILES=$(ls -larth $NEW_PATTERN | wc -l)
  BZ2_FILES=$(ls -R 2>/dev/null -larth $PAT_BZ2 | wc -l)
  CSV_FILES=$(ls -R 2>/dev/null -larth $PAT_CSV | wc -l)
  XML_FILES=$(ls -R 2>/dev/null -larth $PAT_XML | wc -l)

  echo "For pattern $NEW_PATTERN, on $DATE, there are $ALL_FILES files."
  echo " -$XML_FILES XML files, $CSV_FILES csv files and $BZ2_FILES packed bzip2 files." 

  if ([ $BZ2_FILES -gt 0 ] && ([ $CSV_FILES -gt 0 ] || [ $XML_FILES -gt 0 ])  );
    then echo " - Duplicates are possible, maybe some of the bzip2 files have been unpacked without deleting the archive." 
  fi
done
