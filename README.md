# Introduction
# Introduction
this repo include 7 Pracatice with answers for Bash Scripting.
you can clone the repo and use codes.
`git clone https://github.com/soloranger/BashScript-Practice.git `


## Tasks
1. Write a script to get a path from the user, make a backup, compress it and send it to an S3 bucket. For S3 storage, you can use Amazon S3 or MinIO in on-perm environments.


2. Extend the above script to do incremental backups instead of getting everything from scratch. You're able to use other tools like Restic, Kopia, etc.

3. Write a script to serve an HTTP server using bash and create two endpoints for the index page and health check.

4. Extend the above script and implement a simple API /api/v1/users to manage users. As a database, use local files.

5.  Write a script to capture the current state of the file system and show if abnormal changes happened to the files.

6. Extend the above script to allow the user to recover the files that were changed to their previous state.

7. Write a script to watch the Docker config "/etc/docker/daemon.json" to catch the changes and automatically restart the service.
