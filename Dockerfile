FROM postgres:11

COPY datasets /datasets
COPY init-multi-dump.sh /docker-entrypoint-initdb.d/init-multi-dump.sh

RUN chmod +x /docker-entrypoint-initdb.d/init-multi-dump.sh
