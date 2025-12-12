# Postgres
```
psql -h db.example.com -p 5433 -U USER -d DATABASE_NAME
```

```
List all databases:
\l or \lists

Detailed database info (including tables, users, and permissions):
\l+
List all tables in the current database:
\dt
List all tables across all schemas:
\dt *.*
View table details (columns, constraints):
\d table_name
List all schemas:
\dn
Commonly used to find schemas like public, pg_catalog, or custom schemas.
List all views:
\dv

List all database roles (users/groups):
\du
List roles with detailed attributes (memberships, privileges):
\du+

Show current connection details:
\conninfo
Displays host, port, user, database, and encoding.

Exit psql:
\q
```

# mysql
```
mysql -h example.com -P 3306 -u USER -p
```

```
CREATE DATABASE test_db;

USE test_db;
```

```
SHOW DATABASES;

SHOW COLUMNS FROM your_table;

SHOW FULL PROCESSLIST;
```


# Docker swarm
```
docker stack deploy -c compose.yml myapp

docker stack ls

docker stack services myapp

docker stack ps myapp

docker stack rm myapp

docker service logs mywebapp_web --tail 50 --timestamps -f
```
# tail log and do something when pattern detected
```
tail -fn0 logfile | \
while read line ; do
        echo "$line" | grep "pattern"
        if [ $? = 0 ]
        then
                ... do something ...
        fi
done
```
