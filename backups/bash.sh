#!/bin/sh

# Wait for MySQL to be fully initialized
echo "Waiting for MySQL to start..."
until mysqladmin ping -h "localhost" --silent; do
  sleep 1
done

echo "MySQL is up and running, starting backup..."

# Perform the mysqldump backup
mysqldump -h "localhost" -u root --password="${MYSQL_ROOT_PASSWORD}" \
    --single-transaction \
    --result-file="${BACKUP_DIR}/backup.$(date +\%F.\%T).sql" \
    --all-databases

echo "Backup completed."
