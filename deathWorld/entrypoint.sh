#!/bin/sh

mkdir -p /factorio/config

 envsubst < /config/server-settings.json > /factorio/config/server-settings.json \
&& envsubst < /config/server-settings.json > /factorio/config/server-settings.json \
&& envsubst < /config/server-settings.json > /factorio/config/server-settings.json \

for filename in /config/*; do
    envsubst < /config/$(basename "$filename") > /factorio/config/$(basename "$filename")
done

exec /docker-entrypoint.sh