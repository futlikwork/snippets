
# Restore backup for MS SQL docker

## Copy backup to WSL
`\\wsl.localhost\Ubuntu-20.04\home\user1`

## Copy backup to container

`docker cp ./ACTIVE_v1-DailyBackup.bak 2a6b98138aaa:/var/opt/mssql/data/ACTIVE_v1-DailyBackup.bak`

## Restore backup by Azure Data Studio


## Additional

docker container ls
docker exec -it 2a6b98138aaa bash
ls /var/opt/mssql/data
docker exec -it 2a6b98138aaa ls /var/opt/mssql/data

https://nozzlegear.com/blog/backing-up-a-docker-sql-server-database-instance
