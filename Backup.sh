#!/bin/bash
create_backup() {
  src_path=$1
  Backup_name=$2
  CurrentPath=$PWD
  backup_name="${Backup_name}_backup"
  cp -r "$src_path" "$backup_name"

  echo "${CurrentPath}/${backup_name}"
}


compress_backup() {
  backup_path=$1
  echo "${backup_path}"
  tar -czf "${backup_path}.tar.gz" -C "$(dirname "$backup_path")" "$(basename "$backup_path")"
  rm -rf "$backup_path"  # Remove the uncompressed backup
  echo "${backup_path}.tar.gz"
}

send_Minio() {
 commpressed_path=$1
 mc alias set myminio https://object.cloudflow.ir/ dwsclass devopsclass
 echo "Uploading..."
 echo ${commpressed_path}
 mc cp "${commpressed_path}" myminio/devopsclass
}
read -p "Enter the path you want to backup: " src_path
read -p "Enter Your Backup Name:" Backup_name
echo "Backup has been Started..."
backup_path=$(create_backup "$src_path" "$Backup_name")
echo "Backup created at $backup_path"
echo "Compressing backup has been Started..."
Zip_path=$(compress_backup "$backup_path")

echo "Send file to Minio...."
send_Minio "${backup_path}.tar.gz"
