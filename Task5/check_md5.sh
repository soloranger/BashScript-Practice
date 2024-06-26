#!/bin/bash

Compare_checksum() {
 DIR_TO_MONITOR=$1
 CHECKSUM_FILE=$2
 TEMP_CHECKSUM_FILE="/tmp/temp_checksum_file.md5"
 find "$DIR_TO_MONITOR" -type f -exec md5sum {} \; > "$TEMP_CHECKSUM_FILE"
 if diff "$CHECKSUM_FILE" "$TEMP_CHECKSUM_FILE" > /dev/null; then
     echo "No changes detected."
 else
     echo "Changes detected:"
     diff "$CHECKSUM_FILE" "$TEMP_CHECKSUM_FILE"
 fi
 rm "$TEMP_CHECKSUM_FILE"
}

read -p "Enter the path that You create a checkSum: " src_path
read -p "Enter Your MD5 file path:" MD5File_Path

Compare_checksum "$src_path" "$MD5File_Path"
