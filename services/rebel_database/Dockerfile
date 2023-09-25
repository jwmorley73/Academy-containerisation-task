FROM postgres:latest

# Variables
ENV POSTGRES_DB rebel-missions
ENV POSTGRES_USER leia
ENV POSTGRES_PASSWORD r2d2-123!

# Copy the SQL data dump file into the containers init directory
COPY database.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432