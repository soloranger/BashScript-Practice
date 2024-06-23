#!/bin/bash
connnect_minio() {
    export AWS_ACCESS_KEY_ID=$1
    export AWS_SECRET_ACCESS_KEY=$2
    echo "Connecting...."
    URL=$3
    export RESTIC_PASSWORD=$4
    restic -r s3:"${URL}" init

}
Backup_process(){
  URL=$1
  backup_path=$2
 restic -r s3:"${URL}" backup "${backup_path}"
}

read -p "Enter the Path that You want for BackUp: " src_path
read -p "Enter Your Minio URL: " URL #https://object.cloudflow.ir/restic100
read -p "Enter repo Password: " repo_password
connnect_minio "dgNUit4sOeNC8FAb8gWr" "wCbIbB5frqpDho8yhSkEQxI5sBqQKyo1FQ2ilUJd" "$URL" "$repo_password"
Backup_process "$URL" "$src_path"