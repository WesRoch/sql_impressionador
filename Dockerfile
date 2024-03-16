# Use the official Microsoft SQL Server 2022 image
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables
ENV SA_PASSWORD=Contosoretaildw!2024
ENV ACCEPT_EULA=Y

# Create a directory for the database files
WORKDIR /usr/src/app

# Copy your SQL Server scripts to the container
# COPY ./sql-scripts/ /usr/src/app/

# Grant permissions for the scripts
# USER root
# RUN chmod +x /usr/src/app/init-db.sh

# Start SQL Server and initialize the database
CMD /bin/bash ./entrypoint.sh