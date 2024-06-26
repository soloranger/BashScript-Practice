#!/bin/bash
Create_checksum() {
 DIR_TO_MONITOR=$1
 CHECKSUM_FILE=$2
 find "$DIR_TO_MONITOR" -type f -exec md5sum {} \; > "$CHECKSUM_FILE"
 echo "Initial state saved in $CHECKSUM_FILE"
}


read -p "Enter the path you want to Create Md5: " src_path
read -p "Enter Your MD5 file path:" MD5_name

Create_checksum "$src_path" "$MD5_name"


