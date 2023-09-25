# Rebel Database
Database contianing rebel mission information

The aim is to access the container either from within the container or by binding it to the host. Might be an idea to hide the login credentials in the other services and have this be the final one?

Access the PostgreSQL terminal through (executed from within the container):
```
    psql -U $POSTGRES_USER -w $POSTGRES_PASSWORD -d $POSTGRES_DB
```