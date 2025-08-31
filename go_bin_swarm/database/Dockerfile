FROM postgres:15

# Set PostgreSQL configuration via environment variables
ENV POSTGRES_USER=unicorndb \
    POSTGRES_PASSWORD=unicorndb \
    POSTGRES_DB=unicorndb

# Copy SQL initialization script to create the required table
COPY create_table.sql /docker-entrypoint-initdb.d/
