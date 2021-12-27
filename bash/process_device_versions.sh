#!/bin/bash
# Before running this script it is necessary to create a subfolder with running config files
# Task: this script to use output from  "show version"
echo "START DEVICE IOS VERSION  CHECK"
REQUIRED_IOS="16.09.05"
VERSION_SEARCH_TEXT="Cisco IOS XE Software, Version"
echo $REQUIRED_IOS

echo $(date +"%F")
echo $(date +"%T")
echo
for f in device_versions/* 
do 
  echo "BEGIN -- Processing file $f" 
  cat $f | grep uptime  
  DEVICE_VERSION=$(cat $f | grep "$VERSION_SEARCH_TEXT" | cut -d' ' -f6)
  echo Current DEVICE Version: $DEVICE_VERSION
  if [ "$REQUIRED_IOS" != "$DEVICE_VERSION" ] 
  then
    echo Upgrade ios version to: $REQUIRED_IOS
  else 
    echo No Upgrade needed
  echo "END -- Processing file $f"
  fi
done
echo "END DEVICE IOS VERSION CHECK"
