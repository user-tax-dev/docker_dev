EMAIL=""

PASSWORD=""

NAME=pgadmin

docker stop $NAME
docker rm $NAME

docker pull dpage/pgadmin4

rm -rf /var/log/pgadmin/*
docker run -p 2000:80 \
    -e "PGADMIN_DEFAULT_EMAIL=$EMAIL" \
    -e "PGADMIN_DEFAULT_PASSWORD=$PASSWORD" \
    -v "$NOWDIR/config_local.py:/pgadmin4/config_local.py" \
    -v "$NOWDIR/servers.json:/pgadmin4/servers.json" \
    -v "$NOWDIR/pgpass:/root/.pgpass" \
    -v /tmp/psql:/tmp \
    -v /var/log/pgadmin:/var/log \
    --name $NAME \
    --net $NET \
    --restart=always \
    -d dpage/pgadmin4
