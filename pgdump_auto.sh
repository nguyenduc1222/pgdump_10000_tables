#!/bin/bash
# tablename searchpattern, if you want all tables enter "":
P=""
# directory to dump files without trailing slash:
DIR=/home/hackcode2011/dump/dump_dir

# /usr/bin/pg_dump --file "/home/hackcode2011/Downloads/ssc.sql" --host "localhost" --port "5432" --username "postgres" --no-password --verbose --format=c --blobs "SSC"
# tạo file ở nano ~/.pgpass  nội dung file .pgpass có định dạng hostname:port:database:username:password  "localhost:5432:SSC:postgres:123"
# create file nano ~/.pgpass  content file .pgpass have fomat hostname:port:database:username:password   EX: "localhost:5432:SSC:postgres:123"

mkdir -p $DIR
TABLES="$(psql --dbname $DB --host "localhost" --port "5432" --username "postgres" --password -t -c "SELECT table_name FROM information_schema.tables WHERE table_type='BASE TABLE' AND table_name LIKE '%$P%' ORDER BY table_name")"
for table in $TABLES; do
  echo $table
  pg_dump --dbname "SSC" --host "localhost" --port "5432" --username "postgres" -w -t $table > $DIR/$table.sql;
done;
echo done
