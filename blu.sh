#!/bin/bash

TGZFILES=(`ls *tgz`)

echo "The TGZ files are:"
for t in `ls *tgz`
do
  echo $t
done


echo ""
echo "Uncompressing the TGZ files now..."
echo "===================================================================="
for t in `ls *tgz`
do
  echo "     Extracting instance name from $t..."
  i=`echo $t | awk -F\. '{print $1"."$2}'`
  echo "     Extracted: $i"
  echo "     Creating directory $i..."
  mkdir $i
  echo "     Directory created."
  echo "     Uncompressing $t to $i..."
  tar xfz $t -C $i
  echo "     Uncompress done."
  echo "     Deleting $t..."
  rm $t
  echo "     Deleted."
  echo ""
done
echo ""
echo "Done uncompressing all files."
