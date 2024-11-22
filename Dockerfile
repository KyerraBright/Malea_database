# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
FROM mysql/mysql-server:8.0.17

RUN mkdir -p /var/lib/mysql/backups

CMD mysqldump -h "$localhost" -u "$Malea" --password="$Malea123" \
    --single-transaction \
    --result-file=/var/lib/mysql/backups/backup.$(date +%F.%T).sql \
    --all-databases
