# Use the latest MySQL image
FROM mysql:8.0
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
COPY test_db @ 3c7fa05/*.sql /tmp/
COPY test_db @ 3c7fa05/*.dump /tmp/
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
COPY test_db @ 3c7fa05/employees.sql /docker-entrypoint-initdb.d
# Set the root password
ENV MYSQL_ROOT_PASSWORD example
