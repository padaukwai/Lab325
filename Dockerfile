# Use the latest MySQL image
FROM mysql:8.0.43
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
#COPY test_db/*.sql /tmp/
#COPY test_db/*.dump /tmp/
#FROM mysql:8.0.43

RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/datacharmer/test_db.git /docker-entrypoint-initdb.d/test_db \
    && cp /docker-entrypoint-initdb.d/test_db/* /docker-entrypoint-initdb.d/ \
    && rm -rf /var/lib/apt/lists/*
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
#COPY test_db/employees.sql /docker-entrypoint-initdb.d
# Set the root password
ENV MYSQL_ROOT_PASSWORD example
