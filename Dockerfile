# Use the latest MySQL image
FROM mysql
# Set the working directory
WORKDIR /tmp
# Copy all the files to the working directory of the container
#COPY db/test_db/load_departments.dump /docker-entrypoint-initdb.d/
#COPY db/test_db/employees.sql /docker-entrypoint-initdb.d/

##COPY db/test_db/*.sql /tmp/
##COPY db/test_db/*.dump /tmp/
# Copy the main SQL file to docker-entrypoint-initdb.d.
# Scripts and SQL files in this folder are executed on container startup.
# This is specific to MySQL.
#COPY db/test_db/employees.sql /docker-entrypoint-initdb.d

COPY db/test_db1/load_departments.dump /docker-entrypoint-initdb.d/
COPY db/test_db1/employees.sql /docker-entrypoint-initdb.d/
# Set the root password
ENV MYSQL_ROOT_PASSWORD example
