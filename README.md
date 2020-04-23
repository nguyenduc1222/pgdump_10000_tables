#PostgreSQL - dump each table into a different file


- Create file pgpass .pgpass have fomat "hostname:port:database:username:password"

cat "localhost:5432:SSC:postgres:123" > ~/.pgpass

chmod -R 755 dump.sh
./dump.sh
