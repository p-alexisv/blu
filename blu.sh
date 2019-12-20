#!/bin/bash


MAINTGZFILE=$1
if [[ -z $MAINTGZFILE ]]
then
  echo "You need to specify the file to uncompress."
  exit 1
fi

#sanity check on $1
if [[ $MAINTGZFILE =~ "/" ]]
then
  echo "You need to specify just the file name of the compressed file without slashes.  It also has to be in the current directory. exiting."
  exit 255
fi

if [[ -f $MAINTGZFILE ]]
then
  echo
else
  echo "File not found."
  exit 1
fi

#echo $MAINTGZFILE
vmaintfile=(`ls $MAINTGZFILE`)
echo "The main bosh log file that we will uncompress is:"
echo $vmaintfile

filetype=`file $vmaintfile | awk -F: '{print $2}' | awk -F, '{print $1}'`

if [[ $filetype != " gzip compressed data" ]]
then
  echo "$vmaintfile is not a compressed file!  exiting."
  exit 255
fi

read -p "Are you definitely sure you want to uncompress the file in this directory (y/n)? " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Ok, we'll continue then!"
else
  echo "Bye!"
  exit 1
fi

echo ""
echo "Uncompressing the main bosh log file: $vmaintfile now..."
echo "===================================================================="
echo "     Extracting deployment name from $vmaintfile..."
m=`echo $vmaintfile | awk -F\. '{print $1}'`
echo "     Extracted: $m"
echo "     Creating directory $m..."
mkdir $m
if [[ $? != 0 ]]
then
  echo "something nasty happened. exiting."
  exit 2
fi
echo "     Directory created."
echo "     Uncompressing $vmaintfile to $m..."
tar xfz $vmaintfile -C $m
if [[ $? != 0 ]]
then
  echo "something nasty happened. exiting."
  exit 3
fi
echo "     Uncompress done."
echo "     Deleting $vmaintfile..."
rm $vmaintfile
echo "     Deleted."
echo ""

cd $m
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
  if [[ $? != 0 ]]
  then
    echo "something nasty happened. exiting."
    exit 3
  fi
  echo "     Directory created."
  echo "     Uncompressing $t to $i..."
  tar xfz $t -C $i
  if [[ $? != 0 ]]
  then
    echo "something nasty happened. exiting."
    exit 3
  fi
  echo "     Uncompress done."
  echo "     Deleting $t..."
  rm $t
  echo "     Deleted."
  echo ""
done
echo ""
echo "Done uncompressing all files."
