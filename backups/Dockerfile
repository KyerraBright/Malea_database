# Use MySQL 8.0.17 as base image
FROM mysql/mysql-server:8.0.17

# Set environment variables for MySQL user and password (do not hardcode sensitive info in production)
ENV MYSQL_ROOT_PASSWORD=March12001
ENV BACKUP_DIR=/var/lib/mysql/backups

# Create backup directory inside the container
RUN mkdir -p $BACKUP_DIR

# Add the script to handle the backup process
COPY backup.sh /usr/local/bin/backup.sh

# Make sure the backup script is executable
RUN chmod +x /usr/local/bin/backup.sh

# Set the entrypoint to run MySQL and then the backup script
ENTRYPOINT ["sh", "-c", "/usr/local/bin/backup.sh"]
