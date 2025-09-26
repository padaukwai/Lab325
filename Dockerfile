# Use the latest MySQL image
FROM mysql:8.0
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
COPY https://github.com/datacharmer/test_db/*.sql /tmp/
COPY https://github.com/datacharmer/test_db/*.dump /tmp/
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
COPY https://github.com/datacharmer/test_db/blob/3c7fa05e04b4c339d91a43b7029a210212d48e6c/employees.sql /docker-entrypoint-initdb.d
# Set the root password
ENV MYSQL_ROOT_PASSWORD example
